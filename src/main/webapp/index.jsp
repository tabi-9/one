<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>CineNexus — Book Telugu & Tamil Movie Tickets</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root{
  --bg:#f2f5f9; --bg-card:#fff; --primary:#1a1a2e; --primary-light:#2d2d44;
  --bms-red:#f84464; --bms-red-dark:#d63556;
  --accent:#f84464; --accent-light:#ffe0e7; --accent-dark:#d63556;
  --muted:#6b6b7a; --muted-light:#a0a0b0; --surface:#f0efed;
  --success:#2a9d8f; --warning:#ffb400;
  --radius:12px; --radius-sm:8px;
  --shadow:0 2px 12px rgba(26,26,46,.08); --shadow-hover:0 8px 32px rgba(26,26,46,.15);
  --transition:.2s cubic-bezier(.4,0,.2,1);
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:'Inter',system-ui,sans-serif;background:var(--bg);color:var(--primary);line-height:1.5;-webkit-font-smoothing:antialiased}
a{color:inherit;text-decoration:none}
img{display:block;max-width:100%}
button{cursor:pointer;font-family:inherit;border:none;background:none;color:inherit}
.container{width:100%;max-width:1200px;margin:0 auto;padding:0 16px}

/* Buttons */
.btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:10px 24px;border-radius:6px;font-weight:600;font-size:14px;transition:var(--transition);border:2px solid transparent;white-space:nowrap}
.btn-primary{background:var(--bms-red);color:#fff;border-color:var(--bms-red)}
.btn-primary:hover{background:var(--bms-red-dark);border-color:var(--bms-red-dark);transform:translateY(-1px);box-shadow:0 6px 20px rgba(248,68,100,.35)}
.btn-success{background:var(--success);color:#fff;border-color:var(--success)}
.btn-success:hover{background:#21867a;transform:translateY(-1px)}
.btn-outline{background:transparent;color:#fff;border-color:rgba(255,255,255,.4)}
.btn-outline:hover{background:rgba(255,255,255,.15);border-color:#fff}
.btn-block{width:100%;justify-content:center}
.btn:disabled{opacity:.5;cursor:not-allowed;transform:none!important;box-shadow:none!important}

/* Header — BookMyShow style */
header{position:sticky;top:0;z-index:100;background:#333545;color:#fff}
.header-inner{display:flex;align-items:center;justify-content:space-between;gap:16px;padding:10px 0;min-height:60px}
.brand{display:flex;align-items:center;gap:8px;font-weight:800;font-size:22px;letter-spacing:-.3px}
.brand .logo-box{background:var(--bms-red);width:34px;height:34px;border-radius:6px;display:grid;place-items:center}
.brand .accent{color:var(--bms-red)}
.header-left{display:flex;align-items:center;gap:20px;flex:1}
.search-bar{flex:1;max-width:520px;position:relative}
.search-bar input{width:100%;padding:9px 16px 9px 40px;border-radius:6px;border:none;background:#fff;font-size:14px;outline:none;color:var(--primary)}
.search-bar i{position:absolute;left:14px;top:50%;transform:translateY(-50%);color:var(--muted);font-size:14px}
.header-actions{display:flex;align-items:center;gap:20px}
.header-actions a{font-size:14px;font-weight:500;color:#fff;opacity:.9;transition:var(--transition)}
.header-actions a:hover{opacity:1;color:var(--bms-red)}
.mobile-toggle{display:none;width:38px;height:38px;border-radius:50%;font-size:18px;color:#fff}
#mobileMenu{display:none;background:#333545;border-top:1px solid rgba(255,255,255,.1);padding:12px 0 20px;color:#fff}
#mobileMenu ul{list-style:none;display:flex;flex-direction:column;gap:4px}
#mobileMenu a{display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:var(--radius-sm);font-weight:500}
#mobileMenu a:hover{background:rgba(255,255,255,.1)}

/* Hero — BMS style */
.hero{position:relative;background:#1a1a2e;color:#fff;padding:40px 0;margin-bottom:8px}
.hero-inner{display:flex;gap:32px;align-items:center;flex-wrap:wrap}
.hero-poster{flex:0 0 220px;border-radius:12px;overflow:hidden;box-shadow:0 12px 40px rgba(0,0,0,.5);position:relative}
.hero-poster img{width:100%;height:320px;object-fit:cover}
.hero-poster .ribbon{position:absolute;top:12px;left:-30px;background:var(--bms-red);color:#fff;padding:4px 40px;font-size:11px;font-weight:700;transform:rotate(-45deg);letter-spacing:1px}
.hero-info{flex:1;min-width:280px}
.hero-info .lang-pill{display:inline-block;background:rgba(248,68,100,.2);color:#ffb8c6;padding:3px 12px;border-radius:20px;font-size:12px;font-weight:600;margin-bottom:12px}
.hero-info h1{font-size:34px;font-weight:800;line-height:1.15;margin-bottom:10px}
.hero-info .meta-row{display:flex;align-items:center;gap:16px;color:rgba(255,255,255,.7);font-size:13px;margin-bottom:14px;flex-wrap:wrap}
.hero-info .meta-row i{color:var(--warning);margin-right:4px}
.hero-info p{color:rgba(255,255,255,.75);font-size:15px;max-width:560px;margin-bottom:20px}
.hero-info .price-tag{font-size:15px;color:rgba(255,255,255,.9)}
.hero-info .price-tag strong{color:#fff;font-size:20px}

/* Section */
.section{padding:36px 0}
.section-header{display:flex;align-items:flex-end;justify-content:space-between;gap:16px;margin-bottom:20px;flex-wrap:wrap}
.section-header h2{font-size:24px;font-weight:700;letter-spacing:-.3px}
.section-header p{color:var(--muted);margin-top:4px;font-size:14px}
.section-header .see-all{color:var(--bms-red);font-weight:600;font-size:14px;display:flex;align-items:center;gap:6px}

/* Movie cards — BMS style */
.movies-grid{display:grid;grid-template-columns:repeat(5,1fr);gap:18px}
.movie-card{background:transparent;border:none;cursor:pointer;transition:var(--transition);text-align:left}
.movie-card:hover{transform:translateY(-4px)}
.poster-wrap{position:relative;overflow:hidden;background:#ddd;aspect-ratio:2/3;border-radius:10px;box-shadow:var(--shadow)}
.poster-wrap img{width:100%;height:100%;object-fit:cover;transition:var(--transition)}
.movie-card:hover .poster-wrap img{transform:scale(1.03)}
.movie-card.selected .poster-wrap{outline:3px solid var(--bms-red);outline-offset:2px}
.rating-badge{position:absolute;bottom:8px;left:8px;background:rgba(0,0,0,.85);color:#fff;padding:3px 8px;border-radius:4px;font-size:12px;font-weight:700;display:flex;align-items:center;gap:4px}
.rating-badge i{color:#f5a623;font-size:10px}
.lang-tag{position:absolute;top:8px;right:8px;background:rgba(248,68,100,.95);color:#fff;padding:3px 8px;border-radius:4px;font-size:10px;font-weight:700;letter-spacing:.5px}
.movie-card .body{padding:10px 4px 4px}
.movie-card h5{font-size:15px;font-weight:600;line-height:1.3;margin-bottom:2px;color:var(--primary)}
.movie-card .meta{font-size:12px;color:var(--muted);text-transform:uppercase;letter-spacing:.3px}
.movie-card .book-btn{margin-top:8px;width:100%;padding:7px;border-radius:6px;background:var(--bms-red);color:#fff;font-weight:600;font-size:12px;transition:var(--transition)}
.movie-card .book-btn:hover{background:var(--bms-red-dark)}

/* Booking panel */
.booking-panel{background:var(--bg-card);border-radius:var(--radius);box-shadow:var(--shadow-hover);padding:28px;display:none;margin-top:24px;border-top:4px solid var(--bms-red)}
.booking-panel.active{display:block;animation:slideDown .3s ease}
@keyframes slideDown{from{opacity:0;transform:translateY(-12px)}to{opacity:1;transform:translateY(0)}}
.booking-panel h3{font-size:22px;font-weight:700;margin-bottom:4px}
.booking-panel .sub{color:var(--muted);font-size:14px;margin-bottom:24px}
.booking-layout{display:grid;grid-template-columns:1fr 320px;gap:32px}
.booking-info h4{font-size:14px;font-weight:700;margin-bottom:12px;text-transform:uppercase;letter-spacing:.5px;color:var(--muted)}
.booking-info h4 i{color:var(--bms-red);margin-right:6px}
.time-slots{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:24px}
.time-slot{padding:8px 16px;border-radius:6px;border:1px solid #ddd;background:#fff;font-weight:600;font-size:13px;transition:var(--transition);text-align:center;color:var(--muted)}
.time-slot:hover{border-color:var(--bms-red);color:var(--bms-red)}
.time-slot.selected{background:var(--bms-red);color:#fff;border-color:var(--bms-red)}
.time-slot small{display:block;font-weight:400;font-size:10px;opacity:.8;margin-top:2px}

.screen{background:linear-gradient(to bottom,#4a4a5a,#8a8a9a);height:8px;border-radius:50%/100% 100% 0 0;margin:8px auto 6px;max-width:520px}
.screen-label{text-align:center;font-size:10px;letter-spacing:4px;color:var(--muted-light);font-weight:600;margin-bottom:20px}

.seats-grid{display:grid;grid-template-columns:repeat(8,1fr);gap:6px;margin:0 auto 20px;max-width:420px}
.seat{aspect-ratio:1;border-radius:4px;background:#fff;border:1px solid #cfd8dc;display:grid;place-items:center;font-size:9px;font-weight:600;color:#90a4ae;transition:var(--transition);cursor:pointer;user-select:none}
.seat:hover:not(.taken){background:#e0f2f1;border-color:var(--success)}
.seat.selected{background:var(--success);color:#fff;border-color:var(--success)}
.seat.taken{background:#eceff1;color:#cfd8dc;cursor:not-allowed;border-color:#eceff1}
.seat-legend{display:flex;gap:24px;font-size:12px;color:var(--muted);flex-wrap:wrap;justify-content:center;margin-top:8px}
.seat-legend span{display:flex;align-items:center;gap:6px}
.dot{width:14px;height:14px;border-radius:3px;display:inline-block;border:1px solid #cfd8dc}
.dot.available{background:#fff}
.dot.selected{background:var(--success);border-color:var(--success)}
.dot.taken{background:#eceff1;border-color:#eceff1}

.booking-summary{background:#f8f9fb;border-radius:var(--radius-sm);padding:20px;position:sticky;top:80px;align-self:start;border:1px solid #eee}
.booking-summary h4{font-size:14px;font-weight:700;margin-bottom:14px;padding-bottom:12px;border-bottom:1px solid #e0e0e0;text-transform:uppercase;letter-spacing:.5px;color:var(--muted)}
.summary-line{display:flex;justify-content:space-between;padding:6px 0;font-size:13px;color:var(--muted);gap:12px}
.summary-line span:last-child{font-weight:600;color:var(--primary);text-align:right}
.summary-total{display:flex;justify-content:space-between;padding:14px 0 0;margin-top:8px;border-top:2px dashed #ddd;font-size:17px;font-weight:700}
.summary-total span:last-child{color:var(--bms-red)}
.booking-summary .btn{margin-top:16px;border-radius:6px}
.note{font-size:11px;color:var(--muted-light);text-align:center;margin-top:10px}
.selected-seats-display{font-size:12px;color:var(--muted);min-height:18px;margin:4px 0 6px}
.selected-seats-display strong{color:var(--primary)}

/* Modal */
.modal-overlay{position:fixed;inset:0;background:rgba(0,0,0,.6);z-index:200;display:none;align-items:center;justify-content:center;padding:20px}
.modal-overlay.active{display:flex}
.modal{background:#fff;border-radius:12px;padding:36px;text-align:center;max-width:440px;width:100%;box-shadow:var(--shadow-hover);animation:popIn .3s ease}
@keyframes popIn{from{transform:scale(.9);opacity:0}to{transform:scale(1);opacity:1}}
.icon-circle{width:64px;height:64px;border-radius:50%;background:rgba(42,157,143,.12);color:var(--success);display:grid;place-items:center;font-size:28px;margin:0 auto 16px}
.modal h3{font-size:20px;font-weight:700;margin-bottom:6px}
.modal p{color:var(--muted);font-size:14px;margin-bottom:8px}
.modal .details{background:#f8f9fb;border-radius:8px;padding:16px;margin:16px 0 20px;text-align:left;font-size:13px}
.modal .details div{display:flex;justify-content:space-between;padding:4px 0;gap:12px}
.modal .details div span:first-child{color:var(--muted)}
.modal .details div span:last-child{font-weight:600;text-align:right}

/* Toast */
.toast{position:fixed;bottom:30px;left:50%;transform:translateX(-50%) translateY(100px);background:var(--primary);color:#fff;padding:12px 24px;border-radius:8px;font-size:14px;font-weight:600;box-shadow:var(--shadow-hover);z-index:300;opacity:0;transition:all .4s cubic-bezier(.4,0,.2,1);display:flex;align-items:center;gap:10px}
.toast.show{transform:translateX(-50%) translateY(0);opacity:1}
.toast i{color:var(--success)}

/* Footer */
footer{margin-top:16px;padding:40px 0 24px;background:#333545;color:#fff}
.footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:40px;margin-bottom:28px}
.footer-grid .brand{font-size:20px;margin-bottom:8px}
.footer-grid p{color:rgba(255,255,255,.6);font-size:13px;max-width:300px}
.socials{display:flex;gap:10px;margin-top:14px}
.socials a{width:36px;height:36px;border-radius:50%;background:rgba(255,255,255,.1);display:grid;place-items:center;color:#fff;transition:var(--transition)}
.socials a:hover{background:var(--bms-red)}
.footer-grid h5{font-weight:700;font-size:13px;margin-bottom:12px;text-transform:uppercase;letter-spacing:.5px;color:#fff}
.footer-grid ul{list-style:none;display:flex;flex-direction:column;gap:6px}
.footer-grid ul a{color:rgba(255,255,255,.6);font-size:13px}
.footer-grid ul a:hover{color:var(--bms-red)}
.footer-bottom{text-align:center;padding-top:20px;border-top:1px solid rgba(255,255,255,.1);color:rgba(255,255,255,.4);font-size:12px}

/* Responsive */
@media(max-width:1100px){
  .movies-grid{grid-template-columns:repeat(4,1fr)}
  .booking-layout{grid-template-columns:1fr}
  .booking-summary{position:static}
}
@media(max-width:900px){
  .movies-grid{grid-template-columns:repeat(3,1fr)}
  .hero-info h1{font-size:26px}
  .hero-poster{flex:0 0 160px}
  .hero-poster img{height:240px}
  .footer-grid{grid-template-columns:1fr 1fr;gap:24px}
}
@media(max-width:768px){
  nav{display:none}
  .mobile-toggle{display:grid;place-items:center}
  .search-bar{max-width:none}
  .movies-grid{grid-template-columns:repeat(3,1fr);gap:12px}
  .hero-info h1{font-size:22px}
  .section-header h2{font-size:20px}
  .booking-panel{padding:18px}
  .seats-grid{grid-template-columns:repeat(8,1fr);gap:4px;max-width:100%}
  .footer-grid{grid-template-columns:1fr;gap:20px}
  .brand{font-size:18px}
  .brand .logo-box{width:28px;height:28px}
}
@media(max-width:480px){
  .movies-grid{grid-template-columns:repeat(2,1fr);gap:10px}
  .movie-card h5{font-size:13px}
  .seat{font-size:8px}
  .hero-poster{flex:0 0 120px}
  .hero-poster img{height:180px}
  .hero-info h1{font-size:18px}
  .modal{padding:24px}
}
</style>
</head>
<body>

<!-- HEADER -->
<header>
  <div class="container header-inner">
    <div class="header-left">
      <button class="mobile-toggle" id="mobileToggle"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#">
        <span class="logo-box"><i class="fas fa-film" style="font-size:16px"></i></span>
        <span>Cine<span class="accent">Nexus</span></span>
      </a>
    </div>
    <div class="search-bar">
      <i class="fas fa-search"></i>
      <input type="search" placeholder="Search for movies, events, plays, sports and activities" />
    </div>
    <div class="header-actions">
      <a href="#">Sign in</a>
      <button class="icon-btn" style="color:#fff;font-size:18px"><i class="fas fa-bars"></i></button>
    </div>
  </div>
  <div id="mobileMenu">
    <div class="container">
      <ul>
        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#nowShowing"><i class="fas fa-fire"></i> Now Showing</a></li>
        <li><a href="#comingSoon"><i class="fas fa-clock"></i> Coming Soon</a></li>
        <li><a href="#"><i class="fas fa-ticket-alt"></i> My Tickets</a></li>
      </ul>
    </div>
  </div>
</header>

<!-- HERO -->
<section class="hero">
  <div class="container">
    <div class="hero-inner">
      <div class="hero-poster">
        <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&h=600&fit=crop" alt="Pushpa 2" onerror="this.src='data:image/svg+xml;utf8,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22220%22 height=%22320%22><rect fill=%22%231a1a2e%22 width=%22220%22 height=%22320%22/><text x=%22110%22 y=%22160%22 fill=%22%23f84464%22 font-size=%2220%22 text-anchor=%22middle%22 font-family=%22sans-serif%22 font-weight=%22bold%22>PUSHPA 2</text></svg>'">
        <span class="ribbon">PREMIERE</span>
      </div>
      <div class="hero-info">
        <span class="lang-pill">🔥 TELUGU &amp; TAMIL</span>
        <h1>Pushpa 2: The Rule</h1>
        <div class="meta-row">
          <span><i class="fas fa-star"></i> 8.4 / 10</span>
          <span><i class="fas fa-clock"></i> 3h 20m</span>
          <span><i class="fas fa-certificate"></i> UA</span>
          <span><i class="fas fa-film"></i> Action, Drama</span>
        </div>
        <p>Pushpa Raj returns — bigger, bolder, and more dangerous than ever. Book your tickets now and witness the rule.</p>
        <div class="price-tag">Tickets from <strong>₹250</strong> onwards</div>
        <div style="margin-top:20px;display:flex;gap:12px;flex-wrap:wrap">
          <button class="btn btn-primary" onclick="document.getElementById('nowShowing').scrollIntoView({behavior:'smooth'})">
            <i class="fas fa-ticket-alt"></i> Book Now
          </button>
          <button class="btn btn-outline" onclick="document.getElementById('comingSoon').scrollIntoView({behavior:'smooth'})">
            <i class="fas fa-clock"></i> Coming Soon
          </button>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- NOW SHOWING -->
<section class="section" id="nowShowing">
  <div class="container">
    <div class="section-header">
      <div>
        <h2>🎬 Now Showing</h2>
        <p>Telugu &amp; Tamil blockbusters — book your seats</p>
      </div>
      <a href="#" class="see-all">See All <i class="fas fa-chevron-right"></i></a>
    </div>
    <div class="movies-grid" id="moviesGrid"></div>

    <!-- BOOKING PANEL -->
    <div class="booking-panel" id="bookingPanel">
      <h3 id="bookingMovieTitle">Select a movie</h3>
      <p class="sub" id="bookingMovieMeta"></p>

      <div class="booking-layout">
        <div class="booking-info">
          <h4><i class="fas fa-clock"></i> Showtime</h4>
          <div class="time-slots" id="timeSlots"></div>

          <h4><i class="fas fa-couch"></i> Pick Your Seats</h4>
          <div class="screen"></div>
          <div class="screen-label">SCREEN THIS WAY</div>
          <div class="seats-grid" id="seatsGrid"></div>

          <div class="seat-legend">
            <span><span class="dot available"></span> Available</span>
            <span><span class="dot selected"></span> Selected</span>
            <span><span class="dot taken"></span> Taken</span>
          </div>
        </div>

        <div class="booking-summary">
          <h4>Booking Summary</h4>
          <div class="summary-line"><span>Movie</span><span id="sumMovie">—</span></div>
          <div class="summary-line"><span>Showtime</span><span id="sumTime">—</span></div>
          <div class="summary-line"><span>Seats</span><span id="sumSeats">—</span></div>
          <div class="selected-seats-display" id="selectedSeatsDisplay"></div>
          <div class="summary-total"><span>Total</span><span id="sumTotal">₹0</span></div>
          <button class="btn btn-success btn-block" id="confirmBtn" disabled>
            <i class="fas fa-check"></i> Confirm Booking
          </button>
          <p class="note">Maximum 8 seats per booking</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- COMING SOON -->
<section class="section" id="comingSoon">
  <div class="container">
    <div class="section-header">
      <div>
        <h2>🎥 Coming Soon</h2>
        <p>Upcoming Telugu &amp; Tamil releases</p>
      </div>
    </div>
    <div class="movies-grid" id="comingGrid"></div>
  </div>
</section>

<!-- FOOTER -->
<footer>
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="brand"><span class="logo-box"><i class="fas fa-film" style="font-size:16px"></i></span><span>Cine<span class="accent">Nexus</span></span></div>
        <p>India's simplest movie ticket booking for Telugu &amp; Tamil cinema.</p>
        <div class="socials">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
      <div><h5>Company</h5><ul><li><a href="#">About</a></li><li><a href="#">Careers</a></li><li><a href="#">Press</a></li></ul></div>
      <div><h5>Support</h5><ul><li><a href="#">Help Center</a></li><li><a href="#">Refunds</a></li><li><a href="#">Contact</a></li></ul></div>
      <div><h5>Legal</h5><ul><li><a href="#">Privacy</a></li><li><a href="#">Terms</a></li></ul></div>
    </div>
    <div class="footer-bottom">&copy; <span id="year"></span> CineNexus. All rights reserved.</div>
  </div>
</footer>

<!-- SUCCESS MODAL -->
<div class="modal-overlay" id="modalOverlay">
  <div class="modal">
    <div class="icon-circle"><i class="fas fa-check"></i></div>
    <h3>Booking Confirmed!</h3>
    <p>Your tickets are booked. Enjoy the show 🍿</p>
    <div class="details" id="modalDetails"></div>
    <button class="btn btn-primary btn-block" id="modalCloseBtn"><i class="fas fa-thumbs-up"></i> Great!</button>
  </div>
</div>

<!-- TOAST -->
<div class="toast" id="toast"><i class="fas fa-check-circle"></i><span id="toastMsg">Done</span></div>

<script>
/* ============================================================
   MOVIES — Current Telugu & Tamil (2025-2026)
   Prices in ₹ (Indian Rupees)
============================================================ */
const MOVIES = [
  { id:1, lang:'Telugu', title:'Pushpa 2: The Rule', genre:'Action, Drama', rating:8.4, duration:'3h 20m', cert:'UA', price:250,
    img:'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&h=600&fit=crop' },
  { id:2, lang:'Telugu', title:'Game Changer', genre:'Political Action', rating:7.9, duration:'2h 45m', cert:'UA', price:200,
    img:'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=400&h=600&fit=crop' },
  { id:3, lang:'Telugu', title:'Kalki 2898 AD', genre:'Sci-Fi Epic', rating:8.1, duration:'3h 0m', cert:'UA', price:220,
    img:'https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=400&h=600&fit=crop' },
  { id:4, lang:'Telugu', title:'Salaar: Part 1', genre:'Action Thriller', rating:7.6, duration:'2h 55m', cert:'A', price:180,
    img:'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=400&h=600&fit=crop' },
  { id:5, lang:'Tamil', title:'Vettaiyan', genre:'Action Drama', rating:7.8, duration:'2h 40m', cert:'UA', price:190,
    img:'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400&h=600&fit=crop' },
  { id:6, lang:'Tamil', title:'Amaran', genre:'War Biopic', rating:8.6, duration:'2h 50m', cert:'UA', price:210,
    img:'https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?w=400&h=600&fit=crop' },
  { id:7, lang:'Tamil', title:'GOAT', genre:'Action Sci-Fi', rating:7.5, duration:'2h 45m', cert:'UA', price:200,
    img:'https://images.unsplash.com/photo-1608889175123-8ee362201f81?w=400&h=600&fit=crop' },
  { id:8, lang:'Tamil', title:'Leo', genre:'Action Thriller', rating:7.9, duration:'2h 44m', cert:'UA', price:180,
    img:'https://images.unsplash.com/photo-1533929736458-ca588d08c8be?w=400&h=600&fit=crop' }
];

const COMING = [
  { id:101, lang:'Telugu', title:'Pushpa 3', genre:'Action', rating:0, duration:'TBA', cert:'UA', price:280,
    img:'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=400&h=600&fit=crop' },
  { id:102, lang:'Telugu', title:'RRR 2', genre:'Action Epic', rating:0, duration:'TBA', cert:'UA', price:300,
    img:'https://images.unsplash.com/photo-1574267432553-4b4628081c31?w=400&h=600&fit=crop' },
  { id:103, lang:'Tamil', title:'Coolie', genre:'Action Drama', rating:0, duration:'TBA', cert:'UA', price:250,
    img:'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&h=600&fit=crop' },
  { id:104, lang:'Tamil', title:'Thug Life', genre:'Crime Drama', rating:0, duration:'TBA', cert:'A', price:260,
    img:'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=400&h=600&fit=crop' }
];

const SHOWTIMES = ['10:30 AM','1:15 PM','4:00 PM','7:30 PM','10:15 PM'];
const ROWS = ['A','B','C','D','E','F'];
const SEATS_PER_ROW = 8;
const MAX_SEATS = 8;

/* Deterministic "taken" seats */
function generateSeats(seed){
  const seats = [];
  let rnd = seed;
  const rand = () => { rnd
