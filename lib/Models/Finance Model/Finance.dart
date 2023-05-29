class Finance {
  final int paymentId;
  final String fType;
  final double amountPaid;
  final String paymentDate;

  Finance({
    this.paymentId = 1,
    this.fType = "Credit Card",
    this.amountPaid = 1,
    this.paymentDate = "27/5",
  });

  Map<String, dynamic> toMap() {
    return {
      'Payment_id': paymentId,
      'f_type': fType,
      'amount_paid': amountPaid,
      'payment_date': paymentDate,
    };
  }

  factory Finance.fromMap(Map<String, dynamic> map) {
    return Finance(
      paymentId: map['Payment_id'],
      fType: map['f_type'],
      amountPaid: map['amount_paid'],
      paymentDate: map['payment_date'],
    );
  }
}
