# Save old plot settings
par.o <- par("lty")
# Set line type to blank
par(lty=0)
par(mai = c(3.5,0,3.5,0))

# Plot creation
g.ramp <- gray.colors(100, start = 0, end = 0.9)
barplot(rep(2, 100), 
            axes = FALSE,                    
            space = 0, 
            col = g.ramp, 
            main = "",
            xlab = "p-value")

# Add text below
mtext("1%", side = 1, line = 1, at = 7)
mtext("5%", side = 1, line = 1, at = 35)
mtext("10%", side = 1, line = 1, at = 70)

# Add text above
mtext("Very strong", side = 3, line = 1, at = 5)
mtext("Strong", side = 3, line = 1, at = 20)
mtext("Moderate", side = 3, line = 1, at = 40)
mtext("Some", side = 3, line = 1, at = 60)
mtext("Little to no", side = 3, line = 1, at = 90)

# Add title
mtext("Strength of Evidence Against the Null", side = 3, line = 4,
      cex=1.2, font=2)

# Reset plot settings
par(lty = par.o)