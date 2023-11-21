#!/bin/bash
set -euo pipefail

# Source code of the https://github.com/vangquan/AddVi version 2023-11-20

# Define arrays for English and Vietnamese translations
find_book=(
    "Genesis" "Exodus" "Leviticus" "Numbers" "Deuteronomy" "Joshua" "Judges" "Ruth" "1 Samuel" "2 Samuel"
    "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" "Ezra" "Nehemiah" "Esther" "Job" "Psalms" "Proverbs"
    "Ecclesiastes" "Song of Solomon \(Canticles\)" "Isaiah" "Jeremiah" "Lamentations" "Ezekiel" "Daniel" "Hosea" "Joel"
    "Amos" "Obadiah" "Jonah" "Micah" "Nahum" "Habakkuk" "Zephaniah" "Haggai" "Zechariah" "Malachi" "Matthew"
    "Mark" "Luke" "John" "Acts" "Romans" "1 Corinthians" "2 Corinthians" "Galatians" "Ephesians" "Philippians"
    "Colossians" "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" "Titus" "Philemon" "Hebrews" "James"
    "1 Peter" "2 Peter" "1 John" "2 John" "3 John" "Jude" "Revelation"

    "Gênesis" "Êxodo" "Levítico" "Números" "Deuteronômio" "Josué" "Juízes" "Rute" "1 Samuel" "2 Samuel"
    "1 Reis" "2 Reis" "1 Crônicas" "2 Crônicas" "Esdras" "Neemias" "Ester" "Jó" "Salmos" "Provérbios"
    "Eclesiastes" "Cântico de Salomão" "Isaías" "Jeremias" "Lamentações" "Ezequiel" "Daniel" "Oseias" "Joel"
    "Amós" "Obadias" "Jonas" "Miqueias" "Naum" "Habacuque" "Sofonias" "Ageu" "Zacarias" "Malaquias" "Mateus"
    "Marcos" "Lucas" "João" "Atos" "Romanos" "1 Coríntios" "2 Coríntios" "Gálatas" "Efésios" "Filipenses"
    "Colossenses" "1 Tessalonicenses" "2 Tessalonicenses" "1 Timóteo" "2 Timóteo" "Tito" "Filêmon" "Hebreus"
    "Tiago" "1 Pedro" "2 Pedro" "1 João" "2 João" "3 João" "Judas" "Apocalipse"

    "창세기" "출애굽기" "레위기" "민수기" "신명기" "여호수아" "사사기" "룻기" "사무엘상" "사무엘하"
    "열왕기상" "열왕기하" "역대기상" "역대기하" "에스라" "느헤미야" "에스더" "욥기" "시편" "잠언"
    "전도서" "솔로몬의 노래" "이사야" "예레미야" "예레미야 애가" "에스겔" "다니엘" "호세아" "요엘"
    "아모스" "오바댜" "요나" "미가" "나훔" "하박국" "스바냐" "학개" "스가랴" "말라기" "마태복음"
    "마가복음" "누가복음" "요한복음" "사도행전" "로마서" "고린도 전서" "고린도 후서" "갈라디아서" "에베소서"
    "빌립보서" "골로새서" "데살로니가 전서" "데살로니가 후서" "디모테 전서" "디모테 후서" "디도서" "빌레몬서" "히브리서"
    "야고보서" "베드로 전서" "베드로 후서" "요한 1서" "요한 2서" "요한 3서" "유다서" "요한 계시록"

    "創世記" "出エジプト記" "レビ記" "民数記" "申命記" "ヨシュア" "裁き人" "ルツ" "サムエル第一" "サムエル第二"
    "列王第一" "列王第二" "歴代第一" "歴代第二" "エズラ" "ネヘミヤ" "エステル" "ヨブ" "詩編" "格言"
    "伝道の書" "ソロモンの歌" "イザヤ" "エレミヤ" "哀歌" "エゼキエル" "ダニエル" "ホセア" "ヨエル"
    "アモス" "オバデヤ" "ヨナ" "ミカ" "ナホム" "ハバクク" "ゼパニヤ" "ハガイ" "ゼカリヤ" "マラキ"
    "マタイ" "マルコ" "ルカ" "ヨハネ" "使徒" "ローマ" "コリント第一" "コリント第二" "ガラテア" "エフェソス"
    "フィリピ" "コロサイ" "テサロニケ第一" "テサロニケ第二" "テモテ第一" "テモテ第二" "テトス" "フィレモン" "ヘブライ"
    "ヤコブ" "ペテロ第一" "ペテロ第二" "ヨハネ第一" "ヨハネ第二" "ヨハネ第三" "ユダ" "啓示"

    "Génesis" "Éxodo" "Levítico" "Números" "Deuteronomio" "Josué" "Jueces" "Rut" "1 Samuel" "2 Samuel"
    "1 Reyes" "2 Reyes" "1 Crónicas" "2 Crónicas" "Esdras" "Nehemías" "Ester" "Job" "Salmos" "Proverbios"
    "Eclesiastés" "El Cantar de los Cantares" "Isaías" "Jeremías" "Lamentaciones" "Ezequiel" "Daniel" "Oseas" "Joel"
    "Amós" "Abdías" "Jonás" "Miqueas" "Nahúm" "Habacuc" "Sofonías" "Ageo" "Zacarías" "Malaquías" "Mateo"
    "Marcos" "Lucas" "Juan" "Hechos" "Romanos" "1 Corintios" "2 Corintios" "Gálatas" "Efesios" "Filipenses"
    "Colosenses" "1 Tesalonicenses" "2 Tesalonicenses" "1 Timoteo" "2 Timoteo" "Tito" "Filemón" "Hebreos" "Santiago"
    "1 Pedro" "2 Pedro" "1 Juan" "2 Juan" "3 Juan" "Judas" "Apocalipsis"
)
replace_book=(
    "Sáng thế" "Xuất Ai Cập" "Lê-vi" "Dân số" "Phục truyền luật lệ" "Giô-suê" "Quan xét" "Ru-tơ" "1 Sa-mu-ên" "2 Sa-mu-ên"
    "1 Các vua" "2 Các vua" "1 Sử ký" "2 Sử ký" "Ê-xơ-ra" "Nê-hê-mi" "Ê-xơ-tê" "Gióp" "Thi thiên" "Châm ngôn"
    "Truyền đạo" "Nhã ca" "Ê-sai" "Giê-rê-mi" "Ai ca" "Ê-xê-chi-ên" "Đa-ni-ên" "Ô-sê" "Giô-ên"
    "A-mốt" "Áp-đia" "Giô-na" "Mi-chê" "Na-hum" "Ha-ba-cúc" "Xô-phô-ni" "Ha-gai" "Xa-cha-ri" "Ma-la-chi" "Ma-thi-ơ"
    "Mác" "Lu-ca" "Giăng" "Công vụ" "Rô-ma" "1 Cô-rinh-tô" "2 Cô-rinh-tô" "Ga-la-ti" "Ê-phê-sô" "Phi-líp"
    "Cô-lô-se" "1 Tê-sa-lô-ni-ca" "2 Tê-sa-lô-ni-ca" "1 Ti-mô-thê" "2 Ti-mô-thê" "Tít" "Phi-lê-môn" "Hê-bơ-rơ" "Gia-cơ"
    "1 Phi-e-rơ" "2 Phi-e-rơ" "1 Giăng" "2 Giăng" "3 Giăng" "Giu-đe" "Khải huyền"

    "Sáng thế" "Xuất Ai Cập" "Lê-vi" "Dân số" "Phục truyền luật lệ" "Giô-suê" "Quan xét" "Ru-tơ" "1 Sa-mu-ên" "2 Sa-mu-ên"
    "1 Các vua" "2 Các vua" "1 Sử ký" "2 Sử ký" "Ê-xơ-ra" "Nê-hê-mi" "Ê-xơ-tê" "Gióp" "Thi thiên" "Châm ngôn"
    "Truyền đạo" "Nhã ca" "Ê-sai" "Giê-rê-mi" "Ai ca" "Ê-xê-chi-ên" "Đa-ni-ên" "Ô-sê" "Giô-ên"
    "A-mốt" "Áp-đia" "Giô-na" "Mi-chê" "Na-hum" "Ha-ba-cúc" "Xô-phô-ni" "Ha-gai" "Xa-cha-ri" "Ma-la-chi" "Ma-thi-ơ"
    "Mác" "Lu-ca" "Giăng" "Công vụ" "Rô-ma" "1 Cô-rinh-tô" "2 Cô-rinh-tô" "Ga-la-ti" "Ê-phê-sô" "Phi-líp"
    "Cô-lô-se" "1 Tê-sa-lô-ni-ca" "2 Tê-sa-lô-ni-ca" "1 Ti-mô-thê" "2 Ti-mô-thê" "Tít" "Phi-lê-môn" "Hê-bơ-rơ" "Gia-cơ"
    "1 Phi-e-rơ" "2 Phi-e-rơ" "1 Giăng" "2 Giăng" "3 Giăng" "Giu-đe" "Khải huyền"

    "Sáng thế" "Xuất Ai Cập" "Lê-vi" "Dân số" "Phục truyền luật lệ" "Giô-suê" "Quan xét" "Ru-tơ" "1 Sa-mu-ên" "2 Sa-mu-ên"
    "1 Các vua" "2 Các vua" "1 Sử ký" "2 Sử ký" "Ê-xơ-ra" "Nê-hê-mi" "Ê-xơ-tê" "Gióp" "Thi thiên" "Châm ngôn"
    "Truyền đạo" "Nhã ca" "Ê-sai" "Giê-rê-mi" "Ai ca" "Ê-xê-chi-ên" "Đa-ni-ên" "Ô-sê" "Giô-ên"
    "A-mốt" "Áp-đia" "Giô-na" "Mi-chê" "Na-hum" "Ha-ba-cúc" "Xô-phô-ni" "Ha-gai" "Xa-cha-ri" "Ma-la-chi" "Ma-thi-ơ"
    "Mác" "Lu-ca" "Giăng" "Công vụ" "Rô-ma" "1 Cô-rinh-tô" "2 Cô-rinh-tô" "Ga-la-ti" "Ê-phê-sô" "Phi-líp"
    "Cô-lô-se" "1 Tê-sa-lô-ni-ca" "2 Tê-sa-lô-ni-ca" "1 Ti-mô-thê" "2 Ti-mô-thê" "Tít" "Phi-lê-môn" "Hê-bơ-rơ" "Gia-cơ"
    "1 Phi-e-rơ" "2 Phi-e-rơ" "1 Giăng" "2 Giăng" "3 Giăng" "Giu-đe" "Khải huyền"

    "Sáng thế" "Xuất Ai Cập" "Lê-vi" "Dân số" "Phục truyền luật lệ" "Giô-suê" "Quan xét" "Ru-tơ" "1 Sa-mu-ên" "2 Sa-mu-ên"
    "1 Các vua" "2 Các vua" "1 Sử ký" "2 Sử ký" "Ê-xơ-ra" "Nê-hê-mi" "Ê-xơ-tê" "Gióp" "Thi thiên" "Châm ngôn"
    "Truyền đạo" "Nhã ca" "Ê-sai" "Giê-rê-mi" "Ai ca" "Ê-xê-chi-ên" "Đa-ni-ên" "Ô-sê" "Giô-ên"
    "A-mốt" "Áp-đia" "Giô-na" "Mi-chê" "Na-hum" "Ha-ba-cúc" "Xô-phô-ni" "Ha-gai" "Xa-cha-ri" "Ma-la-chi" "Ma-thi-ơ"
    "Mác" "Lu-ca" "Giăng" "Công vụ" "Rô-ma" "1 Cô-rinh-tô" "2 Cô-rinh-tô" "Ga-la-ti" "Ê-phê-sô" "Phi-líp"
    "Cô-lô-se" "1 Tê-sa-lô-ni-ca" "2 Tê-sa-lô-ni-ca" "1 Ti-mô-thê" "2 Ti-mô-thê" "Tít" "Phi-lê-môn" "Hê-bơ-rơ" "Gia-cơ"
    "1 Phi-e-rơ" "2 Phi-e-rơ" "1 Giăng" "2 Giăng" "3 Giăng" "Giu-đe" "Khải huyền"

    "Sáng thế" "Xuất Ai Cập" "Lê-vi" "Dân số" "Phục truyền luật lệ" "Giô-suê" "Quan xét" "Ru-tơ" "1 Sa-mu-ên" "2 Sa-mu-ên"
    "1 Các vua" "2 Các vua" "1 Sử ký" "2 Sử ký" "Ê-xơ-ra" "Nê-hê-mi" "Ê-xơ-tê" "Gióp" "Thi thiên" "Châm ngôn"
    "Truyền đạo" "Nhã ca" "Ê-sai" "Giê-rê-mi" "Ai ca" "Ê-xê-chi-ên" "Đa-ni-ên" "Ô-sê" "Giô-ên"
    "A-mốt" "Áp-đia" "Giô-na" "Mi-chê" "Na-hum" "Ha-ba-cúc" "Xô-phô-ni" "Ha-gai" "Xa-cha-ri" "Ma-la-chi" "Ma-thi-ơ"
    "Mác" "Lu-ca" "Giăng" "Công vụ" "Rô-ma" "1 Cô-rinh-tô" "2 Cô-rinh-tô" "Ga-la-ti" "Ê-phê-sô" "Phi-líp"
    "Cô-lô-se" "1 Tê-sa-lô-ni-ca" "2 Tê-sa-lô-ni-ca" "1 Ti-mô-thê" "2 Ti-mô-thê" "Tít" "Phi-lê-môn" "Hê-bơ-rơ" "Gia-cơ"
    "1 Phi-e-rơ" "2 Phi-e-rơ" "1 Giăng" "2 Giăng" "3 Giăng" "Giu-đe" "Khải huyền"
)

# Define the font file path
font_file="$HOME/Library/Fonts/NotoSans-Bold.ttf"
font_url="https://b.jw-cdn.org/fonts/noto-sans/2.007-edcd458/hinted/NotoSans-Bold.ttf"

# Check if the font file exists
if [[ ! -e "$font_file" ]]; then
    # Download the font from the URL
    curl -o "$font_file" "$font_url" || true
fi

# Read the movie file from stdin
read -r movie_file

# Get the directory and filename of the movie file
movie_directory="$(dirname "$movie_file")"
movie_filename="$(basename "$movie_file")"

# Extract and transform the citation text
citation_text=$(printf "%s" "$movie_filename" | sed -E 's/\./:/g; s/ - .*//; s/ - //')

# Use a regular expression to find and replace the pattern
citation_text=$(printf "%s" "$citation_text" | sed -E 's/([0-9]+) ([0-9]+)/\1:\2/g')

# Loop through the find_book array and replace occurrences in draw_text using perl
for ((i=0; i<${#find_book[@]}; i++)); do
    find_value=${find_book[$i]}
    replace_value=${replace_book[$i]}
    citation_text=$(printf "%s" "$citation_text" | perl -pe "s/(?<!\pL)$find_value(?!\pL)/$replace_value/gi")
done

# Use AppleScript to get the citation text from the user with a here document. Enable this to double-check the citation_text before running the FFmpeg command
#citation_text=$(osascript <<EOF
#    tell application "System Events" to text returned of (display dialog "Your Bible citation for file '$(basename "$movie_file")':" default answer "$citation_text" buttons {"OK"} default button "OK" with title "Enter your Bible citation")
#EOF
#)

# Remove ":mp4" if it exists
citation_text=${citation_text%:mp4}

# Escape colons in the citation text
citation_text="${citation_text//:/\\:}"

# Normalize the citation_text to composed Unicode characters using Python
citation_text=$(printf "%s" "$citation_text" | python3 -c 'import sys, unicodedata; print(unicodedata.normalize("NFC", sys.stdin.read()), end="")')

# Generate the output file path and filename
output_filename="${movie_filename%.*}_Vi.mp4"
output_file="$movie_directory/$output_filename"

# Function to search for ffmpeg in common directories
find_ffmpeg_path() {
    local paths=("/opt/homebrew/bin" "/opt/local" "/usr/local/bin" "/usr/bin" "/bin")
    for path in "${paths[@]}"; do
        if [[ -x "$path/ffmpeg" ]]; then
            printf "%s/ffmpeg" "$path"
            return 0
        fi
    done
    return 1
}

# Find the location of ffmpeg
ffmpeg_path=$(find_ffmpeg_path) || true

if [[ -z "$ffmpeg_path" ]]; then
    printf "Error: ffmpeg not found in common directories. Please install ffmpeg or update the script to specify its location.\n"
    exit 1
fi

# Get the video resolution using ffprobe
resolution=$("$ffmpeg_path" -i "$movie_file" 2>&1 | grep Stream | grep Video | sed -n 's/.* \([0-9]\{3,4\}x[0-9]\{3,4\}\).*/\1/p' || true)

# Generate the FFmpeg command based on the resolution and citation_text
if [[ "$citation_text" == "Nh"* ]]; then
    # Additional case for citation_text starting with "Nh". Here I cannot use "Nhã ca"* because bash does not work well with Unicode. Fortunately, in 66 nwt_VT book names, only one starts with "Nh"
    ffmpeg_command=(
        "$ffmpeg_path"
        "-i" "$movie_file"
        "-vf" "delogo=x=85:y=47:w=470:h=40:show=0,drawtext=text='$citation_text':fontfile=$font_file:fontcolor=white:fontsize=30:x=93:y=53:alpha=0.9"
        "$output_file"
    )
else
    # Cases for different resolutions
    case "$resolution" in
        "1280x720")
            ffmpeg_command=(
                "$ffmpeg_path"
                "-i" "$movie_file"
                "-vf" "delogo=x=85:y=47:w=325:h=40:show=0,drawtext=text='$citation_text':fontfile=$font_file:fontcolor=white:fontsize=30:x=93:y=53:alpha=0.9"
                "$output_file"
            )
            ;;
        "640x480")
            ffmpeg_command=(
                "$ffmpeg_path"
                "-i" "$movie_file"
                "-vf" "delogo=x=60:y=47:w=140:h=40:show=0,drawtext=text='$citation_text':fontfile=$font_file:fontcolor=white:fontsize=18:x=65:y=53:alpha=0.9"
                "$output_file"
            )
            ;;
        *)
            printf "Unsupported resolution: %s\n" "$resolution"
            exit 1
            ;;
    esac
fi

# Run FFmpeg using the background
"${ffmpeg_command[@]}" &

# Capture the PID of the last background command (ffmpeg)
ffmpeg_pid=$!

# Wait for the FFmpeg process to finish
wait "$ffmpeg_pid" || true

# Check if FFmpeg executed successfully
if [[ $? -eq 0 ]]; then
    # Kill the specific FFmpeg process
    kill $ffmpeg_pid || true
    # Delete the original movie file
    rm -f "$movie_file"
else
    osascript -e 'display dialog "An error occurred while processing the video." buttons {"OK"} with title "Error"'
fi

exit 0