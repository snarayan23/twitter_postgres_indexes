CREATE INDEX jsonb_ind1 ON tweets_jsonb USING gin((data->'entities'->'hashtags'));

CREATE INDEX jsonb_ind2 ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));

CREATE INDEX jsonb_ind3 ON tweets_jsonb((data->>'lang'));

CREATE INDEX jsonb_ind4 ON tweets_jsonb USING gin(to_tsvector('english', coalesce(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE (data->>'lang'='en');
