beginning_html <- 
'<div class="tweetbox">
  <article>
  <div class="innertweetbox">
    <div class="spacer"></div>
      <div class="tweetbody">
        <div class="iconholder">
          <div class="iconbox">
            <img src="frog.jpg" alt="Avatar" class="pfp">
          </div>
        </div>
        <div class="content">
          <div class="handle">
              <p class="username" style="float:left">'
middle1_html <-'</P>
              <p style="float:left; padding-left:10px;"></p>
              <p class="handle2" style="float:left">'
middle2_html <-'</P>
          </div>
          <div class="tweet">
            <span style="overflow-wrap: break-word; font-family: \'Segoe UI\', Roboto, Ubuntu, \'Helvetica Neue\', sans-serif;font-size:12px">'
            
end_html <- '</span>
            <div class="interactions">
              <div class="interactionButton"><img src="reply.png" alt="reply" style="width:17px;height:15px"></div>
              <div class="interactionButton"><img src="retweet.png" alt="retweet" style="width:17px;height:15px"></div>
              <div class="interactionButton"><img src="like.png" alt="like" style="width:17px;height:15px"></div>
              <div class="interactionButton"><img src="msg.png" alt="msg" style="width:17px;height:15px"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
</article>
</div>'

make_html <- function(sentence, username, handle) {
  return(paste0(beginning_html, username,
                middle1_html, handle,
                middle2_html, sentence,
                end_html))
}
