enum FormFactor {
  mobile,
  tablet,
  desktop;

  static FormFactor fromWidth(double width) {
    if (width >= 1024) return FormFactor.desktop;
    if (width > 720) return FormFactor.tablet;
    return FormFactor.mobile;
  }
}

extension FormFactorType on FormFactor {
  T map<T>({
    required T Function() mobile,
    required T Function() tablet,
    required T Function() desktop,
  }) {
    return switch (this) {
      .mobile => mobile(),
      .tablet => tablet(),
      .desktop => desktop(),
    };
  }
}
