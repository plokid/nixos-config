final: prev: {
  fcitx5-rime = prev.fcitx5-rime.override {
    rimeDataPkgs = [ ./rime-data ];
  };
}
