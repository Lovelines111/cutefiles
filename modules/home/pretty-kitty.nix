{ pkgs, ... }:

let
  # Base URL for the themes
  baseUrl = "https://raw.githubusercontent.com/atelierbram/Base2Tone-kitty/main/themes";

  # List of theme names and their corresponding sha256 hashes
  themes = {
    "base2tone-cave-dark" = "0j3mf34vcg3haqy65i3pib54xq62v4159nhr5gqrx3943wcirjip";
    "base2tone-cave-light" = "1qzn79h3is29hz6dz0sy6aamz16dvlibbzqsxx9a1jk9fdq770rj";
    "base2tone-desert-dark" = "0fjy07qvnaz18vibzmgn0x6vcnd4qxi4lfj5p5qb3h1858py8883";
    "base2tone-desert-light" = "0r564705f8016nralknapn42lfnw4c4i19zrd4mrqhxpg5k9hiqd";
    "base2tone-drawbridge-dark" = "1154mxi5gq0jafghmnfjpg26ax61h91kk61rnkjmz3aqg52hn5l8";
    "base2tone-drawbridge-light" = "0w5fh8hn7lr7sa9rasd825h3gp3f3fksfhqq0yl0lkvmchjfrg8n";
    "base2tone-earth-dark" = "0sdz6kpfyyv66chnq6xf0lsdwgcbk75pksp59sz9mgyr61fwmrs1";
    "base2tone-earth-light" = "1p0b0kmrnryliqwlfj3ljhbiwrr24d1ccrd95mcna0274h4ikcz7";
    "base2tone-evening-dark" = "15s3bfki075vmga31swvyl46p45vijzfvll2i4srkrd52ld52r6g";
    "base2tone-evening-light" = "1imf1hxam7zw2gzgbxqcl4qzkmdcja2p0zdbblciiqp3hgd34hl7";
    "base2tone-field-dark" = "15vfbk15rapcd7yq4h80g7a2c3hf88fs64v6nd029p6bk7dn6cml";
    "base2tone-field-light" = "0qpkgmk6jnia23lgslbqd68agianmy2fy263h42f6bpzkczib7q2";
    "base2tone-forest-dark" = "0w85z51mhmk73llb8dfsnjyvzim3n1sgv7i92cyjk0wqiazfpypa";
    "base2tone-forest-light" = "12sff3sfynk9cg9vc0aliiy3dlcl97lxrpg0s0rs6llman4lpbch";
    "base2tone-garden-dark" = "1234zhma4imfy4xi4n9slh86s2ysnq500zw0vxg6zaly2za8brdp";
    "base2tone-garden-light" = "0bidpkqc7kjh4kagisms1djiblbnhkwn06r2mva04cqkdf9r74ji";
    "base2tone-heath-dark" = "182qgn2r7frzlxm86lyz7hyp25n9zxk9icmwc453gdc16359bkyl";
    "base2tone-heath-light" = "1wamixvdp4inilizmdfskjl6y4yfmgfmnp84hg9ri5g45gwhdkia";
    "base2tone-lake-dark" = "1dflawpzh4b1jiq9ssk6h73a80vk42ii9pmb3232644dgn8mg0i4";
    "base2tone-lake-light" = "0wzwcns3fwlx9n5pm2g7r1fa8ig6pf6vbla4vyjgrksj2y90d0zi";
    "base2tone-lavender-dark" = "1bjjds46cxiicj3q4zdlixmnqhhf88y4r7v8cnzwnq67xiqw0gd9";
    "base2tone-lavender-light" = "1r5a5g3j6dpvgybhkm5i970jqrvyq1wdycpbvgad2qcn3f3z1sha";
    "base2tone-mall-dark" = "1alb5f4h3iq8akzlzykdhpkbaxp2pp9fwfsf0v35d18w42hcz3qg";
    "base2tone-mall-light" = "0pmz2fkw0krm79cq8c58gx0ymngfrwggy526myqzklgifdg2bqr8";
    "base2tone-meadow-dark" = "1w7rjlxa5p9hkmk070af0q8db1ljpx1rsw26zswblsi8nm2ivvib";
    "base2tone-meadow-light" = "1hzi3z2a54p4kyy9x2dh6bb3jydsqymiw13zg4mh3wwvwpkpf4ns";
    "base2tone-morning-dark" = "1v8fcp3yik36wv40n2yb6zmk2skb6ji85b22qdwfhf0v5w4awq6g";
    "base2tone-morning-light" = "18kq137a5lbj2fbm95skprbcf6bmyakprrd5gmwad3hbp4xzvwxx";
    "base2tone-motel-dark" = "1nnk5lfixxwpvriqa2kigv53n06f1fcs0skxsjb5ki5b01dk5dw1";
    "base2tone-motel-light" = "0y936wkbgd1g9qcdg2yraf45dz4ji1sclp83dq1wxkcc46f6jjqk";
    "base2tone-pool-dark" = "1m05l56dg68fwhnbfnz7l0j7hb2ga9sc4aq7mz1q1vjg6v1hr1w7";
    "base2tone-pool-light" = "1svxx00njmilgi9m4ngvp3wkkyh1ai7rcvww9z5q8ki88c233idp";
    "base2tone-porch-dark" = "00jws2j10r9hv53yrrq630hp8rvk2nyb2ykl681gfkbfingypj1a";
    "base2tone-porch-light" = "13g48mkiqz4c7f29z93xn6zxf3cfihmfybrfjmghvcxyr99cvg1y";
    "base2tone-sea-dark" = "10mfjf52jjzn7y12v8hkhgnwyhi4w8inwbn1h81hgq21zv4s6vmh";
    "base2tone-sea-light" = "1a1vqma8pnsm44rmpdqy8by3fb8hvpwk70rizw3gvyrgi2jqajiw";
    "base2tone-space-dark" = "150dzi33rq4vwpb1h778g0ml6pk9cxh6hvvizhc1liawsz475w7i";
    "base2tone-space-light" = "0wmaviw2zjsymqpl0k35zbcvihggpwg4jfz1pq2jfdnzdvibsngi";
    "base2tone-suburb-dark" = "0v6za3cz8j23cx2l464wn680v1656w19sw8g8csjfa493yjq3a5w";
    "base2tone-suburb-light" = "02r5dvcsanhb3cikqlldclwakx0n96vx1sb49blqhpmglh4940dv";
  };

  # Function to fetch a theme with its sha256
  fetchTheme = theme: sha256: pkgs.fetchurl {
    url = "${baseUrl}/${theme}.conf";
    inherit sha256;
  };

  # Create an attribute set of themes
  themeSet = builtins.mapAttrs fetchTheme themes;
in

# Expose the themes as a package
pkgs.stdenv.mkDerivation {
  name = "kitty-themes";
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out
    ${builtins.concatStringsSep "\n" (
      builtins.map (theme: ''
        cp ${themeSet.${theme}} $out/${theme}.conf
      '') (builtins.attrNames themeSet)
    )}
  '';

}
