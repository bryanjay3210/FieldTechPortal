class CreditCardDto {
  CreditCardDto(
      this.billingZip,
      this.paymentMethod,
      this.totalCharge,
      this.useStoredCard,
      this.cardHolderName,
      this.cardNumber,
      this.cardType,
      this.cardExpDate,
      this.ccv,
      this.nrcId);

  final String? billingZip;
  final String? paymentMethod;
  final String? totalCharge;
  final String? useStoredCard;
  final String? cardHolderName;
  final String? cardNumber;
  final String? cardType;
  final String? cardExpDate;
  final String? ccv;
  final String? nrcId;
}
