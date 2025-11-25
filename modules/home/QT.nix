{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    adwaita-qt
    adwaita-qt6
    qgnomeplatform
    qgnomeplatform-qt6
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "gnome";
    # QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE = "adwaita-dark";  # or "adwaita"
  };
  
  qt = {
    enable = true;
    platformTheme.name = "gtk4";
  };

}
