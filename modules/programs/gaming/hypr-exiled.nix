{
  delib,
  inputs,
  host,
  ...
}:
delib.module {
  name = "programs.hypr-exiled";

  options = delib.singleEnableOption false;

}
