function hdr_compress_web
if test (count $argv) -ne 2
        echo "Wrong number of arguments. Got: "(count $argv)
        echo "Usage: hdr_prepare <input_file> <output_file.mov>"
        return 1
    end

    ffmpeg -y -i $argv[1] -c:v libx265 -preset medium -crf 18 -pix_fmt yuv420p10le -c:a aac -b:a 320k $argv[2]
end