import React from "react";
import { GridContext } from "../grid";

interface WidgetContainer {
  x: number;
  y: number;
  width: number;
  height: number;
}

let WidgetContainer: React.FC<WidgetContainer> = ({
  x: xProp,
  y: yProp,
  width: widthProp,
  height: heightProp,
  children,
  ...otherProps
}) => {
  const { x, y, width, height } = useBox(xProp, yProp, widthProp, heightProp);

  return (
    <div
      style={{
        position: "absolute",
        left: x,
        top: y,
        width,
        height,
        backgroundColor: "rgba(0, 0, 0, 0.1)",
        borderRadius: "8px",
      }}
    >
      {children}
    </div>
  );
};

export { WidgetContainer };

function useBox(x: number, y: number, width: number, height: number) {
  const { columnWidth, rowHeight } = React.useContext(GridContext);

  return {
    x: x * columnWidth,
    y: y * rowHeight,
    width: (x + width) * columnWidth,
    height: (y + height) * rowHeight,
  };
}
