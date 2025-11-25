{ pkgs, ... }:
{
  programs.mangohud = {
    enable = true;
    package = pkgs.mangohud;
    
    settings = {
      # Layout and appearance
      legacy_layout = false;
      background_alpha = "0.4";
      round_corners = "10";
      font_size = "24";
      position = "top-left";
      hud_compact = true;
      table_columns = "3";

      # fps_limit = "0,170,120,5";
      fps_limit = "0,170,180,60";
      fps_limit_method = "early";
      
      # Color theme (pink/lavender)
      background_color = "2E0B36";
      text_color = "FFA3F5";
      gpu_color = "E599F7";
      cpu_color = "E599F7";
      frametime_color = "FFA3F5";
      
      # GPU Section
      gpu_stats = true;
      gpu_temp = true;
      gpu_load_change = true;
      gpu_load_value = "50,90";
      gpu_load_color = "E599F7,FF80F2,FF00EA";
      gpu_voltage = false;
      gpu_name = true;
      gpu_core_clock = true;
      gpu_mem_clock = true;
      procmem = true;
      # proc_ram = true;
      vram = true;
      
      # CPU Section
      cpu_stats = true;
      cpu_temp = true;
      cpu_load_change = true;
      core_load = false;
      cpu_mhz = true;
      cpu_name = true;
      
      # Misc Section
      gamemode = false;
      winesync = false;
      engine_short_names = true;
      # exec = "/home/luvelyne/nebula/V2-out.c 35528";
      fsr = true;
      
      # FPS Section
      fps = true;
      fps_metrics = "current,avg,0.001,0.01";
      frame_timing = true;
      frame_timing_detailed = true;

      # Additional settings
      toggle_hud = "Shift_R+F12";
      threaded = true;
      no_display = true; #stays hidden by default
    };
  };
}
