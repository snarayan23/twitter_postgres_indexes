CREATE INDEX jsonb_ind1 ON tweets_jsonb USING gin((data->'entities'->'hashtags'));

CREATE INDEX jsonb_ind2 ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));

CREATE INDEX jsonb_ind3 ON public.tweets_jsonb USING gin ((data -> 'lang'::text));

CREATE INDEX jsonb_ind4 ON tweets_jsonb using gin( to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) where data->>'lang'='en';


