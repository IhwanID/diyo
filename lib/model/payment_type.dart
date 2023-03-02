enum PaymentType { cash, credit, debit, qris }

extension PaymentTypeExtension on PaymentType {
  String get title {
    switch (this) {
      case PaymentType.cash:
      return "Cash";
       case PaymentType.credit:
      return "Credit Card";
       case PaymentType.debit:
      return "Debit Card";
       case PaymentType.qris:
      return "QRIS";
    }
  }
}