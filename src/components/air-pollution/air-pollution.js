import React from "react";
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend } from "recharts";
import "./air-pollution.css";

const AirPollution = ({ data }) => {
  if (!data || !data.list || data.list.length === 0) {
    return null;
  }

  const airQualityIndex = data.list[0].main.aqi;
  const components = data.list[0].components;

  const pollutionData = [
    { name: "CO", valeur: components.co },
    { name: "NO", valeur: components.no },
    { name: "NO2", valeur: components.no2 },
    { name: "O3", valeur: components.o3 },
    { name: "SO2", valeur: components.so2 },
    { name: "PM2.5", valeur: components.pm2_5 },
    { name: "PM10", valeur: components.pm10 },
  ];

  return (
    <div className="air-pollution">
      <h2>Pollution de l'air</h2>
      <p>Index de qualité de l'air (AQI): {airQualityIndex}</p>
      <BarChart width={300} height={200} data={pollutionData}>
        <XAxis dataKey="name" />
        <YAxis />
        <Tooltip />
        <Legend />
        <Bar dataKey="valeur" fill="#8884d8" />
      </BarChart>
    </div>
  );
};

export default AirPollution;
