import React from "react";
import { Avatar } from "@nextui-org/react";

export default function Profile() {
  return (
    <div className="flex items-center space-x-3">
      <div className="font-bold">Welcome, Admin</div>
      <Avatar isBordered color="primary" src="https://i.pravatar.cc/150?img=44" />
    </div>
  );
}

