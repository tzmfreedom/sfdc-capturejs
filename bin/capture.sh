while getopts "u:p:e:q:o:" OPT
do
    case $OPT in
        u)  USERNAME=$OPTARG
            ;;
        p)  PASSWORD=$OPTARG
            ;;
        e)  ENV=$OPTARG
            ;;
        q)  QUERY=$OPTARG
            ;;
        o)  OUTPUT_DAT=$OPTARG
            ;;
    esac
done

coffee query.coffee -u ${USERNAME} -p ${PASSWORD} -e ${ENV} -q "${QUERY}"  | \
tail -n +2 > ${OUTPUT_DAT}
casperjs capture.coffee --un=${USERNAME} --pw=${PASSWORD} --env=${ENV} --infile=${OUTPUT_DAT}