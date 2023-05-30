// TokenContext.js

import React, { createContext, useState } from "react";

// Context oluşturma
const TokenContext = createContext();

// Sağlayıcı bileşeni oluşturma
const TokenProvider = ({ children }) => {
  const [token, setToken] = useState("");

  return (
    <TokenContext.Provider value={{ token, setToken }}>
      {children}
    </TokenContext.Provider>
  );
};

export { TokenContext, TokenProvider };
