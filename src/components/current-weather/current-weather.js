import React from "react";
import "./current-weather.css";

const CurrentWeather = ({ data }) => {
  if (!data || !data.weather || data.weather.length === 0) {
    return null; 
  }

  return (
    <div className="weather">
      <div className="top">
        <div>
          <p className="city">{data.city}</p>
          {data.weather[0].description && (
            <p className="weather-description">{data.weather[0].description}</p>
          )}
        </div>
        {data.weather[0].icon && (
          <img
            alt="weather"
            className="weather-icon"
            src={`icons/${data.weather[0].icon}.png`}
          />
        )}
      </div>
      <div className="bottom">
        {data.main && (
          <>
            <p className="temperature">{Math.round(data.main.temp)}°C</p>
            <div className="details">
              <div className="parameter-row">
                <span className="parameter-label">Détails</span>
              </div>
              {data.main.feels_like !== undefined && (
                <div className="parameter-row">
                  <span className="parameter-label">Ressenti</span>
                  <span className="parameter-value">
                    {Math.round(data.main.feels_like)}°C
                  </span>
                </div>
              )}
              {data.wind && data.wind.speed !== undefined && (
                <div className="parameter-row">
                  <span className="parameter-label">Vent</span>
                  <span className="parameter-value">{data.wind.speed} m/s</span>
                </div>
              )}
              {data.main.humidity !== undefined && (
                <div className="parameter-row">
                  <span className="parameter-label">Humidité</span>
                  <span className="parameter-value">{data.main.humidity}%</span>
                </div>
              )}
              {data.main.pressure !== undefined && (
                <div className="parameter-row">
                  <span className="parameter-label">Pression</span>
                  <span className="parameter-value">{data.main.pressure} hPa</span>
                </div>
              )}
            </div>
          </>
        )}
      </div>
    </div>

    
    

    
  );
};

export default CurrentWeather;
