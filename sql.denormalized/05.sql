SELECT
    '#' || t.hashtag as tag,
    count(*) as count
FROM (
    SELECT DISTINCT
        data->>'id' as id_tweets,
        jsonb_array_elements(data->'entities'->'hashtags')->>'text' as hashtag
    FROM tweets_jsonb
    WHERE
        to_tsvector('english',data->>'text')@@to_tsquery('english','coronavirus')
        AND
        data->>'lang' = 'en'
    UNION
    SELECT DISTINCT
        data->>'id' as id_tweets,
        jsonb_array_elements(data->'extended_tweet'->'entities'->'hashtags')->>'text' as hashtag
    FROM tweets_jsonb
    WHERE
        to_tsvector('english',data->'extended_tweet'->>'full_text')@@to_tsquery('english','coronavirus')
        AND
        data->>'lang' = 'en'
)t
GROUP BY t.hashtag
ORDER BY count DESC,t.hashtag
LIMIT 1000
;
