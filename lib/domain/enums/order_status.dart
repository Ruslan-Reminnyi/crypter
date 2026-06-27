enum OrderStatus {
  working('Working'),
  inactive('Inactive'),
  filled('Filled'),
  canceled('Canceled'),
  rejected('Rejected');

  final String displayName;

  const OrderStatus(this.displayName);
}
