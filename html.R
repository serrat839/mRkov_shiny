beginning_html <-
'<article class="tweetbox">
    <section>
      <img src="'

middle1_html <- '" alt="Avatar" class="pfp">
    </section>
    <article>
      <section class="handles">
        <p class="username">'
middle2_html <-'</p>
        <p class="handle">'
middle3_html <-'</p>
        <p>&#183</p>
        <p class="timer">Randomly Generated</p>
      </section>
      <section class="tweetbody">
        <p>'
end_html <- '</p>
      </section>
      <section class="ui">
        <div>
          <img src="reply.png">
        </div>
        <div>
          <img src="retweet.png">
        </div>
        <div>
          <img src="like.png">
        </div>
        <div>
          <img src="msg.png">
        </div>
      </section>
    </article>

  </article>'

make_html <- function(sentence, meta_data) {
  return(paste0(beginning_html, meta_data$pfp,
                middle1_html, meta_data$username,
                middle2_html, meta_data$handle,
                middle3_html, sentence,
                end_html))
}
