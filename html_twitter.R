what <- "
  <div>
    <article> # width of 598px
    <div> # has padding on L R of  15
      <div></div> # empty div with hegith of ten, width max
      <div> # margin LR of -5 | this is the box that has the content
        <div> # margin LR of 5 | this is the part that has the pfp
          <div>
            <PFP that is dimensions x^2, spans entire of previous div>
          </div>
        </div>
        <div> # to the right of the pfp area, this is where the tweet info goes. LR margin 5, B padding 10
          <div> # B margin 2
            # this is the area with the name and handle
          </div>
          <div> # The tweets text area, spans 100%lr
            #text is in a span class
          </div>
          <div> # T padding 10
            # this is where the interaction buttons are
          </div>
        </div>
      </div>
    </div>
    </article>
  </div>

























"