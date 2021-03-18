#!/bin/bash
SLEEPTIME=300
DTOPFINDERSCRIPT="/home/jordan/src/utils/find-dtops.py"
POSTEDTOPSFILE="/home/jordan/.dtopbotthreads"
THREAD=`eval $DTOPFINDERSCRIPT`
SCROT="/home/jordan/.desktop.png"
SCROTPOST="/home/jordan/.post.png"
POSTERSCRIPT="/home/jordan/src/DesktopThread/DesktopThread.py"
COMMENT=`misfortune | sed 's/\-//g'`
TIDUSPATH="/home/jordan/Nextcloud/Photos/Tidus/Tidus.jpg"
cd ~/src/DesktopThread
echo "desktop bot"
while true
do
    if [ ! -f "$POSTEDTOPSFILE" ]; then
        touch $POSTEDTOPSFILE
    fi

    if [ "$THREAD" -lt 0 ]; then
        echo "no desktop threads found"
    fi

    if grep -Fxq $THREAD $POSTEDTOPSFILE
        then
            #clear
	    POSTING="False"
            #echo "already posted in "$THREAD
        else
	    echo "posting in $THREAD"
            # not posted in the thread yet
            echo $THREAD >> $POSTEDTOPSFILE
            convert $SCROT \
            \( +clone \
            -fill "#111111" \
            -draw 'color 0,0 reset' \
            -resize x40! \
            -fill white \
            -pointsize 14 \
            -gravity center \
            -annotate 0 'Desktop by Jordan' \
            -gravity east \
            -annotate +10+0 "For /g/ thread $THREAD" \
            -gravity west \
                \( $TIDUSPATH -resize x35 \) \
            -geometry +2.5+0 -composite \) \
            -append $SCROTPOST

            $POSTERSCRIPT -G -X -F $SCROTPOST -C "$COMMENT"

    fi
sleep $SLEEPTIME
THREAD=`eval $DTOPFINDERSCRIPT`
done


