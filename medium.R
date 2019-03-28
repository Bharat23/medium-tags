install.packages('rvest');
install.packages('textcat');
require('rvest');
require('textcat');

data = read.csv('./Medium_Clean.csv', stringsAsFactors = FALSE);

contentList = vector();
 for (i in seq(1, 10)) {
   url = as.vector(data[i, 'url']);
   texts = tryCatch({
     webpage = read_html(url);
     pTags = html_nodes(webpage, 'p');
     pText = html_text(pTags);
     language = textcat::textcat(pText);
     if (language[1] == 'english') {
        pText;
     } else {
       msg = 'non-english';
       msg;
     }
   }, error = function(error_condition) {
     return(error_condition)
   });
   contentList[i] = paste(texts, sep = " ", collapse = " ");
 }
length(contentList)


textcat::textcat(contentList[4])
contentList[5]

data[4,2]
merge(data[,10], contentList)
