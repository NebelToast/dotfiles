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