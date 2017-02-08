while read config equal value; do
    case $config in
        'AWS_ACCESS_KEY') key=${value//\"/} ;;
        'AWS_SECRET_KEY') secret=${value//\"/} ;;
    esac
done < terraform.tfvars
echo $key;
echo $secret;
