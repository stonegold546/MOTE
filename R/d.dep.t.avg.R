#' d.dep.t.avg
#'
#' This function displays d for repeated measures data
#' and the non-central confidence interval using the 
#' average standard deviation of each level as the denominator.
#'
#' @param m1 mean from first level
#' @param m2 mean from second level
#' @param sd1 standard deviation from first level
#' @param sd2 standard deviation from second level
#' @param n sample size
#' @param a significance level
#' @keywords effect size, dependent t-test
#' @export
#' @examples
#' d.dep.t.avg(m1 = 20, m2 = 17, sd1 = 4, sd2 = 5, n = 100, a = .05)


d.dep.t.avg <- function (m1, m2, sd1, sd2, n, a = .05) {
  # Displays d and non-central confidence interval for repeated measures
  # using average standard deviation of levels as the denominator.
  #
  # Args:
  #   m1 : mean from first group
  #   m2 : mean from second group
  #   sd1: standard deviation from first group
  #   sd2: standard deviation from second group
  #   n  : sample size
  #   a  : significance level
  #
  # Returns:
  #   List of d, mean, and sample size statistics
  
  library(MBESS)
  
  d <- (m1 - m2) / ((sd1 + sd2) / 2)
  se1 <- sd1 / sqrt(n)
  se2 <- sd2 / sqrt(n)
  t <- (m1 - m2) / ((se1 + se2) / 2)
  ncpboth <- conf.limits.nct(t, (n - 1), conf.level = (1 - a), sup.int.warns = TRUE)
  dlow <- ncpboth$Lower.Limit / sqrt(n)
  dhigh <- ncpboth$Upper.Limit / sqrt(n)
  M1low <- m1 - se1 * qt(a / 2, n - 1, lower.tail = FALSE)
  M1high <- m1 + se1 * qt(a / 2, n - 1, lower.tail = FALSE)
  M2low <- m2 - se2 * qt(a / 2, n - 1, lower.tail = FALSE)
  M2high <- m2 + se2 *  qt(a / 2, n - 1, lower.tail = FALSE)
  
  output = list("d" = d, #d stats
                "dlow" = dlow, 
                "dhigh" = dhigh, 
                "M1" = m1, #level 1 stats
                "sd1" = sd1,
                "se1" = se1,
                "M1low" = M1low, 
                "M1high" = M1high,
                "M2" = m2, #level 2 stats
                "sd2" = sd2,
                "se2" = se2,
                "M2low" = M2low,
                "M2high" = M2high,
                "n" = n, #sample stats
                "df" = (n - 1)) #no t/p as not appropriate for sig testing
                
  return(output)
  }
