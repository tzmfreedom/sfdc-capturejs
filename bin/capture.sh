while getopts u:p:e: OPT
do
    case $OPT in
        u)  USERNAME=$OPTARG
            ;;
        p)  PASSWORD=$OPTARG
            ;;
        e)  ENV=$OPTARG
            ;;
    esac
done

OUTPUT_DAT=profilelist.dat
QUERY="SELECT id FROM Account LIMIT 3"
coffee query.coffee -u ${USERNAME} -p ${PASSWORD} -e ${ENV} -q "${QUERY}"  | \
tail -n +2 > ${OUTPUT_DAT}
casperjs capture.coffee --un=${USERNAME} --pw=${PASSWORD} --env=${ENV} --infile=${OUTPUT_DAT}