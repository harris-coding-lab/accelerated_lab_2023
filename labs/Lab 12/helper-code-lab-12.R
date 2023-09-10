# Joins

origins <- tibble(band = c("Beatles", "Stones"),
                  origin = c("Liverpool", "London"))

full_names <- 
  tibble(name = c("John", "John", "Paul", "Mick"),
         surname = c("Lennon", "Bonham", "McCartney", "Jagger"))

a <- tibble(time = rep(1:5, each = 2),
            name = rep(c("a", "b"), 5),
            x = rnorm(10))
b <- tibble(obs_time = 1:5,
            name = rep(c("a"), 5),
            y = rnorm(5))

# ggplot

ggplot(storms, aes(wind, pressure)) + 
  geom_point(color = category, shape = status)

ggplot(storms, aes(wind, pressure)) + 
  geom_point(aes(color = "blue", shape = "triangle"))

storms |> 
  filter(name == "Rita" | (name == "Katrina" & year == 2005)) |>
  ggplot(aes(x = lat, y = long, color = status)) + 
  geom_point() + 
  geom_path()


ggplot(storms, aes(wind, pressure)) + 
  # here we map color and shape within geom_point b/c we don't want
  # those groups when we fit our model.
  geom_point(aes(color = category, shape = status)) +
  geom_smooth(method = "gam", se = FALSE)


base_plot <- storms |>
  ggplot(aes(wind, pressure)) + 
  geom_point(aes(color = status)) + 
  labs(title = "A plot where we change scales and themes",
       color = "")  

base_plot +
  scale_color_manual(values = c("tomato", "blue", "green")) +
  scale_y_continuous(breaks = c(900, 950, 1000)) +
  scale_x_log10(breaks = 1:7 * 20) + 
  theme_minimal(base_size = 13) +
  theme(legend.position = "bottom", 
        plot.title = element_text(hjust = .5))

midwest |>
  ggplot(aes(x = percollege, y = percbelowpoverty, color = percpovertyknown)) +
  geom_point() +
  scale_color_continuous(trans = "reverse")


# Base R