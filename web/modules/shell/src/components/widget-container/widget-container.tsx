import React from "react";
import { GridContext } from "../grid";

interface WidgetContainer {
  top: number;
  left: number;
  width: number;
  height: number;
}

let WidgetContainer: React.FC<WidgetContainer> = ({
  top,
  left,
  width,
  height,
  children,
  ...otherProps
}) => {
  const {
    top: boxTop,
    right: boxRight,
    bottom: boxBottom,
    left: boxLeft,
  } = useBox(top, left, width, height);

  return (
    <div
      style={{
        position: "absolute",
        top: boxTop,
        right: boxRight,
        bottom: boxBottom,
        left: boxLeft,
        backgroundColor: "rgba(0, 0, 0, 0.1)",
        borderRadius: "8px",
      }}
    >
      {children}
    </div>
  );
};

export { WidgetContainer };

function useBox(top: number, left: number, width: number, height: number) {
  const { columnWidth, rowHeight } = React.useContext(GridContext);

  return {
    top: top * rowHeight,
    right: (left + width) * columnWidth,
    bottom: (top + height) * rowHeight,
    left: left * columnWidth,
  };
}
