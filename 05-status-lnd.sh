#!/bin/bash
TIME_NOW=$(date +%s)
TIME_YESTERDAY=$(($TIME_NOW-86400))
TIME_WEEK=$(($TIME_NOW-604800))
FWD_TODAY=$(lncli fwdinghistory --start_time=$TIME_YESTERDAY --end_time=$TIME_NOW)
FWD_WEEK=$(lncli fwdinghistory --start_time=$TIME_WEEK --end_time=$TIME_NOW)

echo ''
echo '=============================================================================='
echo '                           LND FORWARDING EVENTS'
echo '=============================================================================='
echo 'FWD TODAY:    '$FWD_TODAY
echo 'FWD WEEK:     '$FWD_WEEK
echo '=============================================================================='
echo ''

