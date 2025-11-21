{pkgs, ... }:
{
  systemd.tmpfiles.rules = [
  "L+ /run/gdm/.config/monitors.xml - - - - ${pkgs.writeText "gdm-monitors.xml" ''
    <monitors version="2">
      <configuration>
        <logicalmonitor>
          <x>0</x>
          <y>0</y>
          <scale>1</scale>
          <primary>yes</primary>
          <monitor>
            <monitorspec>
              <connector>DP-3</connector>
              <vendor>unknown</vendor>
              <product>unknown</product>
              <serial>unknown</serial>
            </monitorspec>
            <mode>
              <width>1920</width>
              <height>1080</height>
              <rate>170</rate>
            </mode>
          </monitor>
        </logicalmonitor>
      </configuration>
    </monitors>
  ''}"
];
}
