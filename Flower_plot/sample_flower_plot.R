source('/home/mpilab/PanT_new/flower_plot.R')
source('/home/mpilab/PanT_new/flower_plot2.R')

tiff('/home/mpilab/PanT_new/Flower_plot.tiff', height = 18, width = 18, units = 'cm', res = 300)
flower_plot(c("Rio", "Wray", "Chinease\namber", "Leoti", "BTX623", "BTX642", "RTX430", 
              "SC187", "Grassl", "PI 329311", "PI 506059", "PI 510757", "PI 655972",
              "PI 229841", "353"),
              c(254, 5, 23, 19, 17, 12, 12, 13, 18, 16, 13, 19, 17, 20, 38),
            c(18244, 16284, 13418, 14404, 15219, 14145, 14443, 13088, 14547, 13097, 
              13491, 13256, 15213, 14106, 11240),
            90, 0.5, 2, labels="Core\n 20743",
              ellipse_col = topo.colors(15, alpha = 0.3), 
              circle_col1 = topo.colors(1, alpha = 0.7),
            circle_col2  = topo.colors(1, alpha = 0.5, rev = TRUE),
            circle_col3 = topo.colors(1, alpha = 0.01, rev = TRUE))
dev.off()

tiff('/home/mpilab/PanT_new/Flower_plot2.tiff', height = 18, width = 18, units = 'cm', res = 300)
flower_plot2(c("Rio", "Wray", "Chinease\namber", "Leoti", "BTX623", "BTX642", "RTX430", 
              "SC187", "Grassl", "PI 329311", "PI 506059", "PI 510757", "PI 655972",
              "PI 229841", "353"),
            c(254, 5, 23, 19, 17, 12, 12, 13, 18, 16, 13, 19, 17, 20, 38),
            c(18244, 16284, 13418, 14404, 15219, 14145, 14443, 13088, 14547, 13097, 
              13491, 13256, 15213, 14106, 11240),
            90, 0.5, 2, labels="Core\n 20743",
            ellipse_col = topo.colors(15, alpha = 0.3), 
            circle_col1 = topo.colors(1, alpha = 0.7),
            circle_col2 = topo.colors(1, alpha = 0.5), 
            circle_col3 = topo.colors(1, alpha = 0.01, rev = T)
            )
dev.off()