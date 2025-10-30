
function fish_greeting

# cbonsai -m "Hewwow :3" -M 12 -L 80 -p
#fortune | pokemonsay
pokemon-icat --scale 2 --generations 5 

#fortune | pokemonsay | lolcat
#timeout 3 brrtfetch -width 80 -fps 17 -multiplier 10 -offset 3 /home/julius/Downloads/brrtfetch-main/gifs/pokemon/darkrai.gif
end
function spf
    set -gx SPF_LAST_DIR "$HOME/.local/state/superfile/lastdir"
    command superfile
    if test -f "$SPF_LAST_DIR"
        source "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    end
end
function hdr_prepare
    if test (count $argv) -ne 2
        echo "Wrong number of arguments. Got: "(count $argv)
        echo "Usage: hdr_prepare <input_file> <output_file.mov>"
        return 1
    end

    ffmpeg -i $argv[1] -c:v prores_ks -profile:v 3 -pix_fmt yuv422p10le -vf "setparams=color_primaries=bt2020:color_trc=arib-std-b67:colorspace=bt2020nc" -c:a copy $argv[2]
end



function hdr_compress_web
if test (count $argv) -ne 2
        echo "Wrong number of arguments. Got: "(count $argv)
        echo "Usage: hdr_prepare <input_file> <output_file.mov>"
        return 1
    end

    ffmpeg -y -i $argv[1] -c:v libx265 -preset medium -crf 18 -pix_fmt yuv420p10le -c:a aac -b:a 320k $argv[2]
end
function hdr_prepare_all
    for file in *
        if test -f "$file"
            set output_file (basename "$file" ."$file[-1]").mov
            echo "Preparing $file -> $output_file"
            if ffmpeg -i "$file" -c:v prores_ks -profile:v 3 -pix_fmt yuv422p10le -vf "setparams=color_primaries=bt2020:color_trc=arib-std-b67:colorspace=bt2020nc" -c:a aac -b:a 320k "$output_file"
                rm "$file"
            end
        end
    end
end

function set_blur


set CURRENT_BLUR (hyprctl getoption decoration:blur:size | grep "int:" | awk '{print $2}')
set BLUR_ENABLED (hyprctl getoption decoration:blur:enabled | grep "int:" | awk '{print $2}') 

if test "$argv[1]" = "+"
  
  if test "$BLUR_ENABLED" = "0"
    hyprctl keyword decoration:blur:enabled true
    hyprctl keyword decoration:blur:size 1
  else
    set NEW_BLUR (math $CURRENT_BLUR + 1)
    if test "$NEW_BLUR" -gt 4
       set NEW_BLUR 4
     end
    hyprctl keyword decoration:blur:size $NEW_BLUR
  end

else if test "$argv[1]" = "-"
  
  if test "$BLUR_ENABLED" = "1"
    
    if test "$CURRENT_BLUR" -gt "0"
      set NEW_BLUR (math $CURRENT_BLUR - 1)
      hyprctl keyword decoration:blur:size $NEW_BLUR
    else
      hyprctl keyword decoration:blur:enabled false
    end
  end
end
end


# fish_add_path /home/nebeltoast/.spicetify
# fish_add_path /home/nebeltoast/.cargo/bin/
# fish_add_path /home/nebeltoast/programmieren/python/scripte/
zoxide init fish | source
alias cd="z"
alias darkrei="brrtfetch -width 80 -fps 17 -multiplier 10 -offset 3 /home/julius/Downloads/brrtfetch-main/gifs/pokemon/darkrai.gif"
alias led="source ledfx_env/bin/activate.fish && ledfx"
alias dooit=' nix-shell /home/julius/.config/dooit/ --run "dooit"'
alias sync='rclone bisync "/home/julius/Videos" "gdrive:Videos" -v'



