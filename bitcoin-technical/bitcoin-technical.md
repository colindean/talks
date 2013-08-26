Bitcoin: digital cryptocurrency for the masses
==============================================

author
:   Colin Dean -> @colindean

institution
: \#ytaets

subtitle
:   August 28, 2013 - YourTalentAgents Emerging Technology Series

# Introduction

![](bitcoin_logo.png){:width='500' height='104'}

# Knowledge Assumptions

* Public key cryptography
* Basic networking fundamentals

# Introduction

Digital cryptocurrency.

* Digital - not a physical object (although physical manifestations exist)
* Crypto - secured by cryptography
* Currency - can be used as a medium of exchange, i.e. money.

# Pedantics of Terminology

* Bitcoin = protocol
* bitcoin = money
* BTC = abbr
* XBT = proposed ISO 4217 code

# Who runs it?

We do.

* Not a company. 
* Not a security. 
* Not a product.

# Who develops it?

* Team of ~12 developers
* Gavin Andresen - lead developer
* Satoshi Nakamoto - author, absent

# Two Key Aspects to Technology

* **Mining** - Generation of Bitcoin
* **Transacting** - Exchange of Bitcoin

# Mining Overview

Two purposes:

* Inflate supply, gradually decreasing
* Verify transaction validity

# Mining Algorithm

* Double SHA256 hashing of previous block information
* Continue until result of **sha256(sha256($input))** begins with 12 zeros
* Other things factored in (difficulty, etc.)

# Inflating Supply

* 12 zeros = block
* Block = block reward
* Block reward = BTC

![Make it RAIN!](raining_bitcoins.png)

# Continue inflating

* Block found every ~10 minutes
* Sometimes more
* Sometimes less

# Gradually decreasing

January 2009
:   50 BTC per block

November 2012
:   25 BTC per block

August 2016?
:   12.5 BTC per block

# Adjusting for advances

* Difficulty aids consistency
  * Up to quarters in a bust (16 decreases)
  * Up to quadruples in a boom (3K% inc since '12)
* Factored into hashing

# Until it stops

* Continues 32 halvings
* Stop at **21,000,000 BTC**

# When? 

* circa 2140

# Or not

Much sooner?

# Total Bitcoin to Exist

21,000,000.00000000 BTC

# Actually actually

* 2,100,000,000,000,000 units
* 2.1 quadrillion
* 1 unit = **satoshi**

# Comparison

* 10.5 trillion USD in M2: Federal Reserve 
  * M2 = money markets + savings + CDs < $100k PLUS
  * M1 = checking accounts PLUS
  * M0 = currency in circulation
  * M3 = larger deposits, institutional money

# Mapped to USD

* $1 -> $200,000
* Worldwide M3 in circulation = ~$75 trillion (2010)


# Coins in circulation

11.5 million

*(as of 8 August 2013)*

# Also, fees

Block reward + transaction fees

2013: 25 BTC + < .5 BTC
2140: 0 BTC + ??? BTC

# Mining programs

* Automation
* Work distribution, via pooled mining
* Alternative processors (GPU, FPGA, ASIC)

# Questions about mining?

* End user not expected to care
* End user expected to *be able to care*

# Transacting Overview

* Generating addresses
* Interconnecting
* Receiving
* Sending

# Generating addresses

* Public key cryptography
  * Private key
  * Public key
* HASH160

# Address composition

* 34 characters
* First character
  * 1 = Bitcoin public key string or **address**
  * 5 = Bitcoin private key string
* Base58 ensures readability
* Checksum

# Interconnecting

* Lookups
  * DNS
  * IRC
* P2P
* Negotiation

# Receiving

* Inputs -> Outputs
* Ledger vs reality
* Verification

# Sending

* Transaction creation
* Spending outputs
* Fees
* Broadcast

# References

* [Federal Reserve Money Stock Measures](http://www.federalreserve.gov/releases/h6/20130711/)
* [Quantative Easing is Nothing New](http://dollardaze.org/blog/?post_id=00762&cat_id=20) by Mike Hewitt
* [Difficulty Adjustment History](https://docs.google.com/spreadsheet/ccc?key=0AmcTCtjBoRWUdHVRMHpqWUJValI1RlZiaEtCT1RrQmc#gid=0)
