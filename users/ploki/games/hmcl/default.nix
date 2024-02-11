{config,pkgs,...}:

{
  home.packages = with pkgs; [
    hmcl
    adoptopenjdk-openj9-bin-8
    adoptopenjdk-openj9-bin-11
    adoptopenjdk-openj9-bin-17
  ];
}