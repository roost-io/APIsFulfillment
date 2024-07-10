Based on the provided API specification, here are the key endpoints and their relationships:

1. Stock Fundamentals:
   - /stock/symbol: List supported stocks
   - /stock/profile and /stock/profile2: Get company profile information
   - /stock/executive: Get company executives and board members
   - /stock/financials: Get financial statements
   - /stock/metric: Get basic financials (P/E, EPS, etc.)
   - /stock/ownership: Get company ownership information
   - /stock/insider-transactions: Get insider transactions

2. Stock Estimates:
   - /stock/recommendation: Get analyst recommendations
   - /stock/price-target: Get price target consensus
   - /stock/revenue-estimate, /stock/eps-estimate: Get revenue and EPS estimates
   - /stock/earnings: Get earnings surprises
   - /calendar/earnings: Get earnings calendar

3. Stock Price:
   - /quote: Get real-time quote data
   - /stock/candle: Get OHLCV data
   - /stock/tick: Get tick data
   - /stock/split: Get stock split data

4. News and Sentiment:
   - /company-news: Get company-specific news
   - /news-sentiment: Get news sentiment for a company

5. Financial Filings:
   - /stock/filings: Get SEC filings
   - /stock/financials-reported: Get financials as reported

6. Alternative Data:
   - /stock/social-sentiment: Get social media sentiment
   - /stock/investment-theme: Get investment themes
   - /stock/supply-chain: Get supply chain relationships
   - /stock/esg: Get ESG scores

7. Economic Data:
   - /calendar/economic: Get economic calendar
   - /economic: Get economic data

Relationships and Use Cases:

1. Company Overview:
   Use /stock/profile, /stock/executive, and /stock/ownership to get a comprehensive overview of a company.

2. Financial Analysis:
   Combine /stock/financials, /stock/metric, and /stock/financials-reported for in-depth financial analysis.

3. Investment Decision Making:
   Use /stock/recommendation, /stock/price-target, and /stock/earnings along with /quote and /stock/candle for making investment decisions.

4. News and Sentiment Analysis:
   Utilize /company-news and /news-sentiment to gauge market sentiment and track company-specific news.

5. Insider Activity Monitoring:
   Combine /stock/insider-transactions and /stock/ownership to monitor insider activity and ownership changes.

6. Earnings Analysis:
   Use /calendar/earnings to track upcoming earnings, then analyze results using /stock/earnings and /stock/eps-estimate.

7. ESG and Thematic Investing:
   Leverage /stock/esg and /stock/investment-theme for ESG-focused or thematic investment strategies.

8. Supply Chain Analysis:
   Use /stock/supply-chain to understand a company's key customers and suppliers.

9. Economic Impact Analysis:
   Combine /calendar/economic and /economic with company-specific data to analyze economic impacts on stocks.

These endpoints can be used together to create comprehensive stock analysis tools, financial research platforms, or automated trading systems.
