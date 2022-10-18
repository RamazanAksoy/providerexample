class Urunlerim {
  String? _iD;
  String? _urunAdi;
  String? _resim;
  String? _fiyat;

  Urunlerim({String? iD, String? urunAdi, String? resim, String? fiyat}) {
    if (iD != null) {
      this._iD = iD;
    }
    if (urunAdi != null) {
      this._urunAdi = urunAdi;
    }
    if (resim != null) {
      this._resim = resim;
    }
    if (fiyat != null) {
      this._fiyat = fiyat;
    }
  }

  String? get iD => _iD;
  set iD(String? iD) => _iD = iD;
  String? get urunAdi => _urunAdi;
  set urunAdi(String? urunAdi) => _urunAdi = urunAdi;
  String? get resim => _resim;
  set resim(String? resim) => _resim = resim;
  String? get fiyat => _fiyat;
  set fiyat(String? fiyat) => _fiyat = fiyat;

  Urunlerim.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _urunAdi = json['UrunAdi'];
    _resim = json['Resim'];
    _fiyat = json['Fiyat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['UrunAdi'] = this._urunAdi;
    data['Resim'] = this._resim;
    data['Fiyat'] = this._fiyat;
    return data;
  }
}