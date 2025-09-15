
enum ImageContainer {
  outletImages(0),
  surveyImages(1),
  selfieImage(2),
  campaignResponse(3),
  stockInwardImages(4),
  paymentImages(5),
  invoiceImages(6),
  dayStartImage(7),
  ocrImage(8),
  distributorImages(9),
  assetImages(10),
  companyImages(11),
  productImages(12),
  carouselBanners(13),
  userProfilePicture(14),
  scenes(15),
  ocr(16),
  imageRecognition(17),
  posm(18),
  lmsLeadImages(19),
  lmsLeadContactImages(20),
  lmsAccountNotesAttachment(21),
  lmsAccountImages(22),
  lmsAccountContactImages(23),
  lmsActivityAttachments(24),
  advanceLeave(999);

  final int value;

  const ImageContainer(this.value);

  /// Get enum from int
  static ImageContainer fromValue(int value) =>
      ImageContainer.values.firstWhere((e) => e.value == value);

  /// Get enum from enum name string
  static ImageContainer fromName(String name) => ImageContainer.values
      .firstWhere((e) => e.name.toLowerCase() == name.toLowerCase());
}
