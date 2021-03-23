The reason for this project...
Discover how to add a calculated column to a Memory Dataset that is connected to
a TRESTResponseDataSetAdapter.

My discovery...
The FDMemTable has an event named "BeforeGetRecords". I thought maybe I could
write code inside this callback that would create the calculated field. I was
unsuccessful on doing that.

Here is why I wanted to do that. I did not want to manually create the fieldefs
for all fields that I wanted. I just wanted to let the JSON create the fields
and then I wanted to tack on my calculated field. If you create the calculated
field in the "BeforeGetRecords" event, you will have problems. What I
experienced was the first row in the dataset never calculated the value for my
new field. The other rows worked except for the first row.

You can, however, use the "BeforeGetRecords" to set visibility of the fields.
That works fine.


