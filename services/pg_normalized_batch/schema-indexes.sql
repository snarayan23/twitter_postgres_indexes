CREATE INDEX index1 ON tweet_tags (id_tweets, tag);

CREATE INDEX index2 ON tweet_tags (tag, id_tweets);

CREATE INDEX index3 ON tweets (id_tweets, lang);

CREATE INDEX index4 ON tweets USING gin(to_tsvector('english',text)) WHERE lang='en';

