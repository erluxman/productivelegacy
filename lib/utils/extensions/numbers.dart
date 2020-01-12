extension NumberExtensions on num {
  String toStringTwoDigits() {
    assert(this.abs()<100);
    var prefix = this.abs() > 9 ? "" : "0";
    String sign = this < 0 ? "-" : "";
    return "$sign$prefix${this.abs().toString()}";
  }
}
