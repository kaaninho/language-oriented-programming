#lang riposte
 
^Content-Type := "application/json"
# set a base URL
%base := https://api.example.com:8441/v1/
 
$uuid := @UUID with fallback "abc"

GET cart/{uuid} responds with 2XX

# Now add something to the cart:

$productId := 41966
$qty := 5
$campaignId := 1
 
$payload := {
  "product_id": $productId,   # we extend the JSON syntax here
  "campaign_id": $campaignId, # in that you can use Riposte variables
  "qty": $qty                 # and you can add comments to JSON, too
}
 
POST $payload to cart/{uuid}/items responds with 200
 
$itemId := /items/0/cart_item_id # extract the item ID
