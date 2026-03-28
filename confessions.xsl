<?xml version="1.0" encoding="UTF-8"?>
<!--
  ============================================================
  Campus Confession Wall — confessions.xsl
  XSLT Stylesheet: transforms confessions.xml into a styled
  HTML confession feed page. No JavaScript required.
  ============================================================
-->

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Output as HTML5 -->
  <xsl:output
    method="html"
    doctype-system="about:legacy-compat"
    encoding="UTF-8"
    indent="yes"/>

  <!-- ====================================================
       ROOT TEMPLATE — builds the full HTML page
  ===================================================== -->
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Campus Confession Wall — All Confessions</title>
        <!-- Shared stylesheet -->
        <link rel="stylesheet" href="style.css"/>
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
        <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;700;800&amp;family=DM+Sans:ital,wght@0,300;0,400;0,500;1,300&amp;display=swap" rel="stylesheet"/>
      </head>
      <body class="feed-body">

        <!-- ── Top Banner ── -->
        <header class="feed-header">
          <div class="header-noise"></div>
          <div class="feed-header-inner">
            <a href="index.html" class="back-link">← Back to Home</a>
            <h1 class="feed-title">Campus Confession Wall</h1>
            <p class="feed-subtitle">Anonymous thoughts from campus — unfiltered.</p>

            <!-- Live count of posts using XSLT count() -->
            <div class="post-count-badge">
              <xsl:value-of select="count(confessions/post)"/>
              <xsl:text> confessions live</xsl:text>
            </div>
          </div>
        </header>

        <!-- ── Main Feed ── -->
        <main class="feed-main">

          <!-- Category filter chips (visual only — no JS) -->
          <nav class="filter-bar" aria-label="Category filter">
            <span class="filter-label">Filter by mood:</span>
            <span class="cat-chip cat-love">❤️ Love</span>
            <span class="cat-chip cat-funny">😂 Funny</span>
            <span class="cat-chip cat-rant">😤 Rant</span>
            <span class="cat-chip cat-study">📚 Study</span>
            <span class="cat-chip cat-other">🤫 Other</span>
          </nav>

          <!-- ── Confession Cards Loop ── -->
          <div class="cards-grid">
            <xsl:for-each select="confessions/post">

              <!-- Determine CSS class based on category value -->
              <article>
                <xsl:attribute name="class">
                  <xsl:text>confession-card</xsl:text>
                  <xsl:choose>
                    <xsl:when test="category = 'Love'"> card--love</xsl:when>
                    <xsl:when test="category = 'Funny'"> card--funny</xsl:when>
                    <xsl:when test="category = 'Rant'"> card--rant</xsl:when>
                    <xsl:when test="category = 'Study'"> card--study</xsl:when>
                    <xsl:otherwise> card--other</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>

                <!-- Post number watermark -->
                <span class="card-number">
                  <xsl:text>#</xsl:text>
                  <xsl:value-of select="@id"/>
                </span>

                <!-- Category Tag -->
                <div class="card-top">
                  <span>
                    <xsl:attribute name="class">
                      <xsl:text>category-tag</xsl:text>
                      <xsl:choose>
                        <xsl:when test="category = 'Love'"> tag--love</xsl:when>
                        <xsl:when test="category = 'Funny'"> tag--funny</xsl:when>
                        <xsl:when test="category = 'Rant'"> tag--rant</xsl:when>
                        <xsl:when test="category = 'Study'"> tag--study</xsl:when>
                        <xsl:otherwise> tag--other</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>

                    <!-- Category emoji icon -->
                    <xsl:choose>
                      <xsl:when test="category = 'Love'">❤️ </xsl:when>
                      <xsl:when test="category = 'Funny'">😂 </xsl:when>
                      <xsl:when test="category = 'Rant'">😤 </xsl:when>
                      <xsl:when test="category = 'Study'">📚 </xsl:when>
                      <xsl:otherwise>🤫 </xsl:otherwise>
                    </xsl:choose>

                    <xsl:value-of select="category"/>
                  </span>
                </div>

                <!-- Confession Text -->
                <p class="card-text">
                  <xsl:value-of select="text"/>
                </p>

                <!-- Card Footer: Likes -->
                <div class="card-footer">
                  <span class="likes-badge">
                    <span class="heart-icon">❤️</span>
                    <xsl:value-of select="likes"/>
                    <xsl:text> likes</xsl:text>
                  </span>
                  <span class="anon-tag">🕶 Anonymous</span>
                </div>

              </article>

            </xsl:for-each>
          </div>
          <!-- /cards-grid -->

        </main>

        <!-- ── Footer ── -->
        <footer class="site-footer">
          <div class="footer-inner">
            <span class="footer-logo">📌 Campus Confession Wall</span>
            <p class="footer-note">Transformed with XSLT · Styled with CSS · Powered by XML</p>
            <p class="footer-credit">A student project · All confessions are fictional &amp; for demo purposes.</p>
          </div>
        </footer>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
