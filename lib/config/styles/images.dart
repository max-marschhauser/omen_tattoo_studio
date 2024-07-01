class OMImages {
  OMImages._privateConstructor();

  static final OMImages shared = OMImages._privateConstructor();

  get _main => 'assets/images/';

  get logoSmall => _main + 'logo-small.jpeg';

  get logoMedium => _main + 'logo-medium.jpeg';

  get logoLarge => _main + 'logo-large.jpeg';

  get logoSimple => _main + 'logo-simple.jpeg';

  get logoTransparent => _main + 'logo-transparent.png';
}
