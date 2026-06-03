enum Symbol {
  ethusdt('ethusdt', 'ETH/USDT'),
  bnbusdt('bnbusdt', 'BNB/USDT');

  final String symbol;
  final String displayName;

  const Symbol(this.symbol, this.displayName);
}
