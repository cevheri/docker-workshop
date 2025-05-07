#!/bin/sh
echo "Starting fake api requester ..."
API_URL="${API_URL:-https://api.cevheri.com/v1/data}" 
INTERVAL="${INTERVAL:-600}"  


echo "API_URL: $API_URL"
echo "INTERVAL: $INTERVAL"

while true; do
  echo "--------------------------------"
  # Get the current time(with format YYYY-MM-DD HH:MM:SS) and url
  CURRENT_TIME=$(date +%Y-%m-%d\ %H:%M:%S)
  echo "$CURRENT_TIME: Requesting $API_URL"

  curl "$API_URL" --output /dev/null
  CURRENT_TIME=$(date +%Y-%m-%d\ %H:%M:%S)
  echo "$CURRENT_TIME: Request finished"
  sleep "$INTERVAL"
  echo "--------------------------------"
done

echo "Fake api requester finished"

# Run docker restart always
# docker run -d --restart always --name far-talk2data -e API_URL=https://api.cevheri.com/v1/data -e INTERVAL=600 -v $(pwd)/data:/app/data far:latest

# docker logs trace and tail last 100 lines
#docker logs -f --tail 100 far-talk2data