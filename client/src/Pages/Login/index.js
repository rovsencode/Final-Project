import React from 'react'
import '../Login/index.scss'

function Login() {
  return (


      <div className="sign section--bg" data-bg="img/section/section.jpg">
        <div className="container">
          <div className="row">
            <div className="col-12">
              <div className="sign__content">
                {/* authorization form */}
                <form action="#" className="sign__form">
                  <a href="index.html" className="sign__logo">
                    <img src="img/logo.svg" alt="" />
                  </a>
                  <div className="sign__group">
                    <input type="text" className="sign__input" placeholder="Email" />
                  </div>
                  <div className="sign__group">
                    <input type="password" className="sign__input" placeholder="Password" />
                  </div>
                  <div className="sign__group sign__group--checkbox">
                    <input id="remember" name="remember" type="checkbox" defaultChecked="checked" />
                    <label htmlFor="remember">Remember Me</label>
                  </div>
                  <button className="sign__btn" type="button">Sign in</button>
                  <span className="sign__text">Don't have an account?
                    <a href="signup.html">Sign up!</a></span>
                  <span className="sign__text"><a href="#">Forgot password?</a></span>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

export default Login