flower_plot2 <- function(sample, value1, value2, start, a, b,  
                         ellipse_col = rgb(135, 206, 235, 150, max = 255), 
                         circle_col1 = rgb(0, 162, 214, max = 255),
                         circle_col2= rgb(0, 162, 214, max = 255),
                         circle_col3= rgb(0, 162, 214, max = 255),
                         circle_text_cex = 1, labels=labels) {
  par( bty = "n", ann = F, xaxt = "n", yaxt = "n", mar = c(0.5,0.5,0.5,0.5))
  plot(c(0,10),c(0,10),type="n")
  n   <- length(sample)
  deg <- 360 / n
  res <- lapply(1:n, function(t){
    ellipse_col <- ellipse_col[t]
    plotrix::draw.ellipse(x = 5 + cos((start + deg * (t - 1)) * pi / 180), 
                          y = 5 + sin((start + deg * (t - 1)) * pi / 180), 
                          col = ellipse_col,
                          border = ellipse_col,
                          a = a, b = b, angle = deg * (t - 1))
    text(x = 5 + 2.5 * cos((start + deg * (t - 1)) * pi / 180),
         y = 5 + 2.5 * sin((start + deg * (t - 1)) * pi / 180),
         value1[t]
         )
    text(x = 5 + 1.45 * cos((start + deg * (t - 1)) * pi / 180),
         y = 5 + 1.45 * sin((start + deg * (t - 1)) * pi / 180),
         cex=0.75,
         value2[t]
    )
    if (deg * (t - 1) < 180 && deg * (t - 1) > 0 ) {
      text(x = 5 + 3.3 * cos((start + deg * (t - 1)) * pi / 180),
           y = 5 + 3.3 * sin((start + deg * (t - 1)) * pi / 180),
           sample[t],
           srt = deg * (t - 1) - start,
           adj = 1,
           cex = circle_text_cex
      )
      
    } else {
      text(x = 5 + 3.3 * cos((start + deg * (t - 1)) * pi / 180),
           y = 5 + 3.3 * sin((start + deg * (t - 1)) * pi / 180),
           sample[t],
           srt = deg * (t - 1) + start,
           adj = 0,
           cex = circle_text_cex
      )
    }           
  })
  plotrix::draw.circle(x = 5, y = 5, r = 0.7, col = circle_col1, border = circle_col1 )
  plotrix::draw.circle(x = 5, y = 5, r = 1.1, col = circle_col2, border = circle_col2 )
  plotrix::draw.circle(x = 5, y = 5, r = 1.75, col = circle_col3, border = circle_col3 )
  # tune location by x and y.
  text(x = 5, y = 5, labels=labels)
}
