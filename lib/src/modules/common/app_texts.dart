class AppTexts {
  factory AppTexts() {
    return _appTexts;
  }

  AppTexts._();

  static final _appTexts = AppTexts._();

  static String? _tr(String key) {
    return null;

    // try {
    //   final value = CsvLocalizations.instance.string(key);
    //   if (value.isEmpty) {
    //     return null;
    //   }
    //   return value;
    // } catch (e) {
    //   return null;
    // }
  }

  String get kPlanogramCompliance =>
      _tr("kPlanogramCompliance") ?? "Planogram Compliance";

  String get kIdealPlanogramIssue =>
      _tr("kIdealPlanogramIssue") ?? "Ideal Planogram Image is null";

  String get kPlanogramImageIssue =>
      _tr("kPlanogramImageIssue") ?? "Planogram image is null";

  String get errorSomethingWentWrong =>
      _tr("errorSomethingWentWrong") ?? "Oops! Something went wrong.";

  String get underConstruction =>
      _tr("underConstruction") ?? "Under Construction";

  String get kBeat => _tr("kBeat") ?? "Beat";

  String get kRoute => _tr("kRoute") ?? "Route";

  String get kRetailing => _tr("kRetailing") ?? "Retailing";

  String get kOfficialWork => _tr("kOfficialWork") ?? "Official Work";

  String get kJointWorking => _tr("kJointWorking") ?? "Joint Working";

  String get kMarkLeave => _tr("kMarkLeave") ?? "Mark Leave/ Weekly Off";

  String get kLeave => _tr("kLeave") ?? "Leave";

  String get kDuplicateOutletWarning =>
      _tr("kDuplicateOutletWarning") ??
      "Hey, One outlet found with same phone number. You cannot create new outlet with same contact number."
          "You can click on outlet to take order.";

  String get kOutletInDifferentRoute =>
      _tr("kOutletInDifferentRoute") ??
      "Hey, One outlet found with same phone number. You cannot create new outlet with same contact number."
          "You should change Route to take Order.";

  String get kNotVisited => _tr("kNotVisited") ?? "NOT VISITED";

  String get kImageRecognition =>
      _tr("kImageRecognition") ?? "Image Recognition";

  String get kSKUAvailability => _tr("kSKUAvailability") ?? "SKU Availability";

  String get kIRDetectionFailed =>
      _tr("kIRDetectionFailed") ?? "Image Recognition Detection Failed";

  String get kIRDataNotProcessed =>
      _tr("kIRDataNotProcessed") ?? "Image Recognition Data Not Processed";

  String get kIrSyncData => _tr("kIrSyncData") ?? "Sync Image Recognition Data";

  String get kBrandSkuCount => _tr("kBrandSkuCount") ?? "Brand SKU Count";

  String get kTotalObjectCount =>
      _tr("kTotalObjectCount") ?? "Total Object Count";

  String get kShelfShare => _tr("kShelfShare") ?? "Shelf Share";

  String get kAssetScore => _tr("kAssetScore") ?? "Asset Score";

  String get kQualityConcerns => _tr("kQualityConcerns") ?? "quality concerns";

  String get kShelfSharePercentage =>
      _tr("kShelfSharePercentage") ?? "Shelf Share %";

  String get kSkuWiseDetails => _tr("kSkuWiseDetails") ?? "SKU wise Details";

  String get kNoSkuDetected => _tr("kNoSkuDetected") ?? "No SKU Detected";

  String get kRetake => _tr("kRetake") ?? "Retake";

  String get kPreview => _tr("kPreview") ?? "Preview";

  String get kIrResults => _tr("kIrResults") ?? "IR Results";

  String get kVisited => _tr("kVisited") ?? "VISITED";

  String get kOrder => _tr("kOrder") ?? "ORDER";

  String get kNoOrder => _tr("kNoOrder") ?? "NO ORDER";

  String get kNoOrdersTaken => _tr("kNoOrdersTaken") ?? "No Orders Taken.";

  String get kProductWiseSalesMsg =>
      _tr("kProductWiseSalesMsg") ??
      "PLACE ORDER TO VIEW PRODUCT WISE SALES DATA HERE.";

  String get kUnauthenticatedMsg =>
      _tr("kUnauthenticatedMsg") ?? "Error 403 - Unauthenticated error.";

  String get kSomethingWentWrong =>
      _tr("kSomethingWentWrong") ?? "Something went wrong!";

  String get kNoDataFound => _tr("kNoDataFound") ?? "No Data Found";

  String get kIRISWorking => _tr("kIRISWorking") ?? "IR IS WORKING";

  String get kSkip => _tr("kSkip") ?? "Skip";

  String get kIrLoading => _tr("kIrLoading") ?? "Loading IR Data...";

  String get kPleaseWait => _tr("kPleaseWait") ?? "Please Wait !";

  String get kIrOrderStockWarning =>
      _tr("kIrOrderStockWarning") ?? "Order quantity exceeds stock!";

  String get kStock => _tr("kStock") ?? "Stock";

  String get kSeeResults => _tr("kSeeResults") ?? "See Results";

  String get kExitIrConfirmationMsg =>
      _tr("kExitIrConfirmationMsg") ?? "Are you sure you want to exit IR?";

  String get kYes => _tr("kYes") ?? "Yes";

  String get kNo => _tr("kNo") ?? "No";

  String get kRetakePicture => _tr("kRetakePicture") ?? "Retake Picture";

  String get kRetakePhoto => _tr("kRetakePhoto") ?? "Retake Photo";

  String get kViewIdeal => _tr("kViewIdeal") ?? "View Ideal Planogram";

  String get kBefore => _tr("kBefore") ?? "Before";

  String get kAfter => _tr("kAfter") ?? "After";

  String get kCaptureBeforeImg =>
      _tr("kCaptureBeforeImg") ?? "Capture Before Image";

  String get kCompliant => _tr("kCompliant") ?? "Compliant";

  String get kIdealShelfPlanogram =>
      _tr("kIdealShelfPlanogram") ?? "Ideal Shelf Planogram";

  String get kContinueToCapture =>
      _tr("kContinueToCapture") ?? "Continue to Capture";

  String get kProceed => _tr("kProceed") ?? "Proceed";

  String get kUBLFacings => _tr("kUBLFacings") ?? "UBL Facings";

  String get kBrandFacings => _tr("kBrandFacings") ?? "Brand Facings";

  String get kUBShelfShare => _tr("kUBShelfShare") ?? "UB Shelf Share";

  String get kShareOfShelf => _tr("kShareOfShelf") ?? "Share of Shelf";

  String get kMustSell => _tr("kMustSell") ?? "Must Sell";

  String get kTotalFacings => _tr("kTotalFacings") ?? "Total Facings";

  String get kPremiumSku => _tr("kPremiumSku") ?? "Premium SKU";

  String get kFail => _tr("kFail") ?? "Fail";

  String get kImproveScoreMsg =>
      _tr("kImproveScoreMsg") ?? "Improve your IR score.";

  String get kBad => _tr("kBad") ?? "Bad";

  String get kAverage => _tr("kAverage") ?? "Average";

  String get kGood => _tr("kGood") ?? "Good";

  String get kCoolerPurityClassification =>
      _tr("kCoolerPurityClassification") ?? "Cooler Purity Classification";

  String get kSkuDetails => _tr("kSkuDetails") ?? "SKU Details";

  String get kSkus => _tr("kSkus") ?? "SKUs";

  String get kOther => _tr("kOther") ?? "Other";

  String get kSku => _tr("kSku") ?? "SKU";
}
