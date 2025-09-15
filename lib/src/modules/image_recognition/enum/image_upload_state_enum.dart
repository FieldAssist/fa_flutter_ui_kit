enum IrImageUploadStateEnum { before, after, singleImage }

IrImageUploadStateEnum irImageUploadStateFromInt(int value) {
  if (value == 0) {
    return IrImageUploadStateEnum.before;
  } else if (value == 1) {
    return IrImageUploadStateEnum.after;
  }
  return IrImageUploadStateEnum.singleImage;
}

int irImageUploadStateToInt(IrImageUploadStateEnum state) => state.index;
