Display the stocks which had "big-mover months", and how many of those months they had. Order your results from the stocks with the most, to least, "big-mover months".

What is a big-mover month?
A "big-mover month" is when a stock closes up or down by greater than 10% compared to the price it opened at.
For example, when COVID hit and e-commerce became the new normal, Amazon stock in April 2020 had a big-mover month because the price shot up from $96.65 per share at open to $123.70 at close – a 28% increase!

ticker	| date	| open |	close	| percent_change
AMZN	| 04/01/2020 00:00:00	| 96.65	| 123.70	| 28.0
NFLX	| 04/01/2022 00:00:00	| 376.80	| 190.36 |	-49.5
Netflix stock had a big-mover month in April 2022 in the reverse direction. 
That month, Netflix reported that the company lost 200k subscribers in Q1, and expected to lose another two million subs in Q2. In Apr'22, Netflix stock opened that month at $376.80 per share, but closed at $190.36, representing a 49.5% loss – yikes!

Query
SELECT  ticker, COUNT(ticker)
FROM stock_prices
WHERE (((open - close) / open) *100) > 10 OR (((open - close) / open) *100) < -10
GROUP BY ticker
ORDER BY count DESC;
