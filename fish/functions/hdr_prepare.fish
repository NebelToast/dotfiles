function hdr_prepare
    if test (count $argv) -ne 2
        echo "Wrong number of arguments. Got: "(count $argv)
        echo "Usage: hdr_prepare <input_file> <output_file.mov>"
        return 1
    end

    ffmpeg -i $argv[1] -c:v prores_ks -profile:v 3 -pix_fmt yuv422p10le -vf "setparams=color_primaries=bt2020:color_trc=arib-std-b67:colorspace=bt2020nc" -c:a copy $argv[2]
end
